Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB79E185B47
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 09:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgCOIsN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 04:48:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36455 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbgCOIsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 04:48:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id s1so11395504lfd.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=FwpsoPnb0uiEDo3w/SoEh0vneNhnBrDJaTVBogS6Zro=;
        b=SdSbIhcvqhK55sEt6w5yzP2MDI/i9zd7+YTqgEcr9Jaula8OMvuPDmAHxBocnvxxMX
         ZJ/98Z/FL26tD5SMEZIr1sQyQgTG45rt0Yz5w4Mmw+gySiD3QrRVRTiPVfwBL+VZR9Ef
         d3cRrCUx1UhXNhXklD2UYX6aMZiH+PllnzmItu6uXVtaGBl0u21Z02jxXZvoKJ1GlaU3
         +oC5S4fsNIoLHON0K8lLmDf1AlW/gD2Sz1LVr09uGbVRZoxQekLNlJZusy6xcYfKzNLH
         h3xAqlApiD9LtaJgpx3TzVbtyP/J8Ss797/oWDI6v5c+DHl8ktbsITRZga2PSXw9wcn+
         f9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=FwpsoPnb0uiEDo3w/SoEh0vneNhnBrDJaTVBogS6Zro=;
        b=ILSoxXcsKU31u9BC0pwFG/PdttE3IYh2YSCN+t+kb9//q5yAiQSY7CGrRPLFvuphTT
         1dmAXSgZUkRIFCWGVBnEOcfAOGBN2SFDtn/Nsl61LfJX8B0Xwg6E+Oqqz2LlphcdIRGx
         9P6GGCIBo5uttA9YeOxV12FnTBS5ZyXE5r8H1brISI38Uf71GhAtPxEMayr6sGKVsb2V
         NF5SCMHvlq9A182RRZhRjdMfiUMsetf//FEyg53vZR/2cAIhM4WtWdGJPAjNGovFYVVR
         9XnIJrg4+gkPx9oJmHZF45FMZEnv8fJ6RAoCgSzGvSnWbqTo/C/JGyzVxBLVi+2F9uJC
         VTgw==
X-Gm-Message-State: ANhLgQ09XwitNpxZqzEdNkau0sFGWkQCS9YI+O29VJCE3NZsnEU+TZ+g
        IBI1KwdHWEJV5nvxaZTBU0/sTCuZuTM=
X-Google-Smtp-Source: ADFU+vvTjBc/gPsvBs2evQSKtbkjxXxnh7b4Quy2dhmMCX4ZLESrb8xcTXqBCzLWPOmViHMlBjDUKA==
X-Received: by 2002:a19:c3d8:: with SMTP id t207mr13382958lff.44.1584262090989;
        Sun, 15 Mar 2020 01:48:10 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id n7sm12417683lfi.5.2020.03.15.01.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 01:48:09 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed kick_transfer
In-Reply-To: <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com> <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com> <874kusgwuz.fsf@kernel.org> <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
Date:   Sun, 15 Mar 2020 10:48:05 +0200
Message-ID: <87o8syf1h6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> If dwc3 fails to issue START_TRANSFER/UPDATE_TRANSFER command, then we
>>> should properly end an active transfer and give back all the started
>>> requests. However if it's for an isoc endpoint, the failure maybe due to
>>> bus-expiry status. In this case, don't give back the requests and wait
>>> for the next retry.
>>>
>>> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> could you give some details regarding when does this happen?
>>
>
> So, here are the scenarios in which dwc3_send_gadget_ep_cmd() may return=
=20
> a negative errno:
>
> * -EAGAIN: Isoc bus-expiry status
>  =C2=A0=C2=A0 As you already know, this occurs when we try to schedule is=
oc too=20
> late. If we're going to retry the request, don't unmap it.

right

> * -EINVAL: No resource due to issuing START_TRANSFER to an already=20
> started endpoint
>  =C2=A0=C2=A0 This happens generally because of SW programming error

Sounds like this should be fixed separately and, probably, we should add
a WARN() so we catch these situations. Have you reproduced this
particular case?

> * -ETIMEDOUT: Polling for CMDACT timed out
>  =C2=A0=C2=A0 This should not happen unless the controller is dead or in =
some bad=20
> state

Understood

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5t68UACgkQzL64meEa
mQYBkw/7BV2NZo1pmgq0T6yhxMzHkFRM47Bpw/oRuro8SfWaVKu4+eaaaALZnzvm
jolPirGOEr7adM9hLSlqI0WpI/guKdwRJ/s/nF79BDZxjgdoTKalGVVuqNsVhNy6
oMMwAUGAnSt+6GuaAmVrBscW9zZ+5/slRX14RwxWH0l1c/DiWcjiJmhiau7mdWl3
318b/lxyfag8+QlY2iJ/QeZWEuFZLtI99Sm++P4D/65oTHDet+SUEwajwNZ4jdfY
12EeAcneIuT3Iwx+o8OKn+iYxkjo5aBxv2/NjGF8oNoIqKTt9XjG9RLRCuLozyGK
pxDq4hZAPsObqalhQd3YafDOoBxU0Dnau/vQ5bNoDVv5lOyg3uwUBjTGls3M2yZI
9sIS/ejbK9q/5OMx7a223V2ZHgCR+XJvwYrWuxfPLbYBoK+n44ZVxfmzVaNR5zyw
JDCh4tbwfwD80qhvonnIuO0DWf7vZUZVvdFxm9YGF48TRsPCIms218zrx4WmLAw9
SEbUQ63itCPqynDWjeVYFcIrZ3xE1Y7vjX8I3N6OKkn2TWtWRBbJ+BEs75qtdyY7
+s/koIbwzyKzj76YuHYU7Ajpkag+d258o09LVdYGGj+yf+lERq9aFNjslZDV57bA
QUcfSiz8lvXpWdSzzaDKza/JfyLjKznVu7ADNHq2MLIrtbo5cJI=
=Itjq
-----END PGP SIGNATURE-----
--=-=-=--
