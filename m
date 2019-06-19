Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319AA4B20A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 08:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbfFSGVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 02:21:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:56836 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfFSGVq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 02:21:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 23:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="asc'?scan'208";a="335098147"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2019 23:21:44 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lianwei Wang <lianwei.wang@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
In-Reply-To: <CAJFUiJg1EOS=i8anPr2U_o2+yX6hYikmh97b1ywF5NMe672vyA@mail.gmail.com>
References: <20190614070243.31565-1-lianwei.wang@gmail.com> <87tvcogzbv.fsf@linux.intel.com> <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com> <87d0jbgxyq.fsf@linux.intel.com> <CAJFUiJg1EOS=i8anPr2U_o2+yX6hYikmh97b1ywF5NMe672vyA@mail.gmail.com>
Date:   Wed, 19 Jun 2019 09:21:40 +0300
Message-ID: <87fto6f62z.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Lianwei Wang <lianwei.wang@gmail.com> writes:
>> Lianwei Wang <lianwei.wang@gmail.com> writes:
>> > On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
>> >>
>> >> Lianwei Wang <lianwei.wang@gmail.com> writes:
>> >>
>> >> > The udc and gadget device will be deleted when udc device is
>> >> > disconnected and the related function will be unbind with it.
>> >> >
>> >> > But if the configfs is not deleted, then the function object
>> >> > will be kept and the bound status is kept true.
>> >> >
>> >> > Then after udc device is connected again and a new udc and
>> >> > gadget objects will be created and passed to bind interface.
>> >> > But because the bound is still true, the new gadget is not
>> >> > updated to netdev and a previous freed gadget will be used
>> >> > in netdev after bind.
>> >> >
>> >> > To fix this using after freed issue, always set the gadget
>> >> > object to netdev in bind interface.
>> >> >
>> >> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
>> >>
>> >> I can't actually understand what's the problem here. The gadget is not
>> >> deleted when we disconnect the cable.
>> >>
>> >> --
>> >> balbi
>> >
>> > The issue was observed with a dual-role capable USB controller (e.g. I=
ntel
>> > XHCI controller), which has the ability to switch role between host an=
d device
>> > mode. The gadget is deleted when we switch role to device mode from ho=
st
>> > mode. See below log:
>> > # echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_st=
ate #(4.4)
>>
>> oh, so you're using a modified tree :-) Then we can't really help.
>>
>> > [   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
>> > [   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
>> > [   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
>> > [   41.191192] usb 1-1: USB disconnect, device number 3
>> > [   41.191284] usb 1-1.1: USB disconnect, device number 4
>> > [   41.218958] usb 1-1.5: USB disconnect, device number 5
>> > [   41.238117] android_work: sent uevent USB_STATE=3DCONFIGURED
>> > [   41.240572] android_work: sent uevent USB_STATE=3DDISCONNECTED
>>
>> What is this android_work. That doesn't exist upstream.
>>
>> > [   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs=
-gadget'
>> > [   41.263413] configfs-gadget gadget: unbind function 'Function FS
>> > Gadget'/ffff8801db049e38
>> > [   41.263969] configfs-gadget gadget: unbind function
>> > 'cdc_network'/ffff8801d8897400
>> > [   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
>> > [   41.720957] dabr_udc deleted
>> > [   41.721097] dabridge 1-5 deleted
>> >
>> > The UDC and gadget will be deleted after switch role to device mode.
>> > And they will be
>> > created as new object when switching back to host mode. At this time
>> > the bind in function
>> > driver (e.g. f_ncm) will not set the new gadget.
>> >
>> > For kernel 4.19+, the role switch command will be:
>> >   echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/ro=
le
>> >
>> > The latest Intel role switch kernel driver can be found here:
>> >   https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/i=
ntel-xhci-usb-role-switch.c
>>
>> Right, please test against v5.2-rc5 and show me the problem on that
>> kernel. I can't apply patches for problems that may not even exist in
>> upstream, sorry.
>>
>> --
>> balbi
>
> The issue exist in main line kernel, but I can not test it with
> v5.2-rc5 kernel. I tested it with 4.19 kernel,

which of the v4.19?

> which, for the usb gadget part, has almost the same code as v5.2. It
> is 100% reproducible with dual role
> USB controller or by removing UDC hardware. Take f_ncm for example,
> the use case as follows:

Keep in mind that the way android handles dual-role is completely
different from what we have upstream.

> 1. USB controller is in host mode, f_ncm and UDC is configured in configf=
s.
>    - The ncm is instanced and alloced when "functions/ncm.usb0" is
> created and it will be freed
>       when those files are delted from configfs.
>
> 2. enable the gadget and bind it to this ncm function.
>     - For the first time running, ncm_opts->bound is 0 and
> gether_set_gadget is called to set the
>       gadget. The bound is set to 1 then.
>
> 3. If the UDC is disconnected from bus, then the UDC and its gadget is

what do you mean by "disconnected from the bus"? Removing the cable
(aka, disconnect) will only cause the ->disconnect() callback to be
called. It will not result in the UDC being freed. Is this, perhaps,
something specific to android?

> deleted. But because the
>     ncm.usb0 is still there, ncm object is not freed and
> ncm_opts->bound is still set.
>     There are two ways to disconnect the UDC hardware. One is for dual
> role host controller by switch
>     host controller role to device mode. Another way is by removing
> the UDC hardware from bus, both
>     will generate an usb device disconnect event to UDC driver to
> delete udc and gadget.

not true, unless I misunderstand what you mean. Disconnect will generate
a disconnect interrupt in most UDCs (except for dummy) and the
=2D>disconnect() callback will be called. Nothing will be freed.

> 4. Now the bound of ncm is still set and gadget is deleted due to udc
> disconnected. And if we connect
>     the udc device again, then it will create new udc and gadget and
> bind to ncm again. But because
>     bound is already set, the new gadget is not set to gether
> (gether_register_netdev not called).
>
> Not sure if this is clear to you. Please review the scenario and the patc=
h.

This sounds a little like it's android-specific. Is your platform using
dwc3? Can you capture tracepoints of the failure? ftrace_dump_on_oops
will help getting the actual tracepoints in this case.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0J1HQACgkQzL64meEa
mQZ68BAAny4Xepfz60Ew/r1ZExv1fNj9+qGaBflJaq6P8Q/Mggx7DXUbySIApCwu
dSoSxeoNnNaa8rKWTck519HLwgI9zf30KiSB0XVb+9Nr4KPHJuHdtbVN8AigxyZF
3XoI27rYy3oNn2+7Tl8kJWuMZsEDjpa8h6Z/C7ce7HjhaHjoaRu8iUI9WIbMSUuN
oLHPP0EDZf7i+MEKa05O3f47vL8xhF+eO1DgIG6PdjFPlig6BPdVqnVDTP3jG82v
FQEdg9YIrearm8wtiuSGPdog6uOjOUv7lvuKKYRWmW49fMMqlhCt3vxxhXVaw8vN
013fuC5O7K6WlmNJDns3JFaQb/wUWVsjYM/4srwjALJ9AtDHV0gDibRGurXeLevN
MMzDCs0XYj9Gbk2qZlnu29SgeCntiA+y71GtKsV9nAxy84zQnqbRY3iF5jAYjtzw
9nce5S11Gn6Zw9vmRphaqPaJH9/If+lK2ykuSEyf8N2K9mXvJXlWtqnKWkFXA7y/
+ZisT2KDzll6+qDj6bYT+LotzKksIrscvhBLQoI9C0lUw/DlwucCRyC7cHebCWFo
SjndRNdSE7DVpFi0FN3UJw7SAgZgetE9I80OG41Bs1zgE/DjmnHi2ZxklNTqwSO6
bLN1qGg+uORW1SFxABKIRn+sbOn8kWM/Vm8F8E/+RruR5p5cBd0=
=GyPd
-----END PGP SIGNATURE-----
--=-=-=--
