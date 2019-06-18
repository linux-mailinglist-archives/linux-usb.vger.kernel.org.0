Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C41349A63
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 09:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfFRHV4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 03:21:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:64340 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbfFRHVz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 03:21:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 00:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; 
   d="asc'?scan'208";a="186014466"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2019 00:21:53 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lianwei Wang <lianwei.wang@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: gadget: avoid using gadget after freed
In-Reply-To: <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com>
References: <20190614070243.31565-1-lianwei.wang@gmail.com> <87tvcogzbv.fsf@linux.intel.com> <CAJFUiJh4zQDvnS7BhUam14LtUrb5ad=hiukQgiYbOiUZs4zVcg@mail.gmail.com>
Date:   Tue, 18 Jun 2019 10:21:49 +0300
Message-ID: <87d0jbgxyq.fsf@linux.intel.com>
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
> On Mon, Jun 17, 2019 at 5:40 AM Felipe Balbi <balbi@kernel.org> wrote:
>>
>> Lianwei Wang <lianwei.wang@gmail.com> writes:
>>
>> > The udc and gadget device will be deleted when udc device is
>> > disconnected and the related function will be unbind with it.
>> >
>> > But if the configfs is not deleted, then the function object
>> > will be kept and the bound status is kept true.
>> >
>> > Then after udc device is connected again and a new udc and
>> > gadget objects will be created and passed to bind interface.
>> > But because the bound is still true, the new gadget is not
>> > updated to netdev and a previous freed gadget will be used
>> > in netdev after bind.
>> >
>> > To fix this using after freed issue, always set the gadget
>> > object to netdev in bind interface.
>> >
>> > Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
>>
>> I can't actually understand what's the problem here. The gadget is not
>> deleted when we disconnect the cable.
>>
>> --
>> balbi
>
> The issue was observed with a dual-role capable USB controller (e.g. Intel
> XHCI controller), which has the ability to switch role between host and d=
evice
> mode. The gadget is deleted when we switch role to device mode from host
> mode. See below log:
> # echo p > /sys/devices/pci0000:00/0000:00:15.1/intel-cht-otg.0/mux_state=
 #(4.4)

oh, so you're using a modified tree :-) Then we can't really help.

> [   41.170891] intel-cht-otg intel-cht-otg.0: p: set PERIPHERAL mode
> [   41.171895] dwc3 dwc3.0.auto: DWC3 OTG Notify USB_EVENT_VBUS
> [   41.187420] dwc3 dwc3.0.auto: dwc3_resume_common
> [   41.191192] usb 1-1: USB disconnect, device number 3
> [   41.191284] usb 1-1.1: USB disconnect, device number 4
> [   41.218958] usb 1-1.5: USB disconnect, device number 5
> [   41.238117] android_work: sent uevent USB_STATE=3DCONFIGURED
> [   41.240572] android_work: sent uevent USB_STATE=3DDISCONNECTED

What is this android_work. That doesn't exist upstream.

> [   41.263285] platform dabr_udc.0: unregister gadget driver 'configfs-ga=
dget'
> [   41.263413] configfs-gadget gadget: unbind function 'Function FS
> Gadget'/ffff8801db049e38
> [   41.263969] configfs-gadget gadget: unbind function
> 'cdc_network'/ffff8801d8897400
> [   41.325943] dabridge 1-1.5:1.0: Port 3 VBUS OFF
> [   41.720957] dabr_udc deleted
> [   41.721097] dabridge 1-5 deleted
>
> The UDC and gadget will be deleted after switch role to device mode.
> And they will be
> created as new object when switching back to host mode. At this time
> the bind in function
> driver (e.g. f_ncm) will not set the new gadget.
>
> For kernel 4.19+, the role switch command will be:
>   echo "device" > /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
>
> The latest Intel role switch kernel driver can be found here:
>   https://elixir.bootlin.com/linux/v5.2-rc5/source/drivers/usb/roles/inte=
l-xhci-usb-role-switch.c

Right, please test against v5.2-rc5 and show me the problem on that
kernel. I can't apply patches for problems that may not even exist in
upstream, sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0IkQ0ACgkQzL64meEa
mQZ/AQ/+N/vD5ieIzqMPsYMUSNCBpVCa99U4xl6VkJ/KvUZZK+9DL5hEWGgSQQ41
kxJhSyD+8ABN0ybajVEGzhOBfeDVAu2UFvndNhNRzpv42Lz8rPplX0IXvqlh8fWr
tiexwVlF+3rCtXQda2F5lNoJTjwls/WaRPT9FyPT/XW/9cGd7jk9Pg+j4gGG/GV7
tfW88pwgr/IyQ8xgTpW7iPktFxZv5ecnIsNkZbvJjysBvt4oDs2NqGT0HNAbvyNK
M11zfQwowdYzBOfo4QSABqqMtvo+PPYZK/iWcc87rW61kR9FZF+1WcoY5JRj7Kn3
Rveq1whnEo+9dXP6CZ2pEgHvtJpdCeU4MnlfZIhNT5EMxFmB59aIszD34PPpiYpI
US/uWyp9SvJ/WrwIgJx+ROQZFcu+HZYK0NYqjTR0uN92PQ1rdxqr/5GSCpEr01cd
2roKxIkKd550YSb4fWUKj0kTTUJy/bD5IvGlPYFFUmcpD61zg5z0ji30iY06VA3+
2qXTJcZV5739B2kycVrpP7CPUiJCBeDzfGcCM3eoQJBFuYE378vlMsGrfQ5SHxq6
E6dXy+WCWGt1n+HmdLm8yHpCo9SyWJpwr+R3kkaelBtq+AkgXt1uEfeOM80HVt3W
bG3vSvpK04eCfbsQ3GsuXa65NfSZzHaV53xi6R5OsBon/sGMTVU=
=Yw5v
-----END PGP SIGNATURE-----
--=-=-=--
