Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1B75B777D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbiIMRPB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbiIMROd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 13:14:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC12174348
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 09:03:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F00DB80E22
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 16:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A69EC433D6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663084931;
        bh=h6RNdQBXNVMC1ofGQ22JixNLu4C3ADU8C4Ujdc506NQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=smZ4PVfXNE8Sj5R/bOuvUAQL0z4g3wiARoOOTiZDxFTLgoRAF7q2u7gLStBqpgMzb
         2/874o/eAkH85euomDJ1szDy2A7KWZF8n8QnJ5d8at14eAGukUWw0o6SIN1DBaHSyk
         2qwRAUDaY9ToPcRdXkRAmkKCCx5OXwl2Ti8OBZBGVJ1vSkyiwRWiGLUkTtUR1WlfqM
         l2d+f1YycJPIKciViSsNXp0aEXhx/HtlKO7tr9iWIwOdadhwQ+V9V6t0MaHuBE0K0l
         XFrtG0DNU4LRPmxkTgoFBm0rcXAzk6Laux5/hYva7TFKFXo3ybh7BTUMp2xAgY6x1D
         nO7vpfkWdwE7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DADA2C433E4; Tue, 13 Sep 2022 16:02:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216470] [Regression] xhci_hcd 0000:08:00.2: xHC error in
 resume, USBSTS 0x401, Reinit
Date:   Tue, 13 Sep 2022 16:02:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216470-208809-HCY9v44gGU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216470-208809@https.bugzilla.kernel.org/>
References: <bug-216470-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216470

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #3)
> It's a new message as of 5.17-rc6 or later.
>=20
> https://github.com/torvalds/linux/commit/
> 8b328f8002bcf29ef517ee4bf234e09aabec4d2e
>=20
> The behavior however is not new; it's due to this quirk introduced a few
> years back for your model.
>=20
> https://github.com/torvalds/linux/commit/
> a7d57abcc8a5bdeb53bbf8e87558e8e0a2c2a29d
>=20
> I don't think we should be doing anything functionally here.  The only th=
ink
> that might make sense IMO is downgrading the message to INFO or not showi=
ng
> it instead of WARN when `xhci->broken_suspend` is set.
>=20
> Something like this:
>=20
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 38649284ff88..a7ef675f00fd 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1183,7 +1183,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hiberna=
ted)
>         /* re-initialize the HC on Restore Error, or Host Controller Erro=
r */
>         if (temp & (STS_SRE | STS_HCE)) {
>                 reinit_xhc =3D true;
> -               xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x,
> Reinit\n", temp);
> +               if (!xhci->broken_suspend)
> +                       xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x,
> Reinit\n", temp);
>         }
>=20
>         if (reinit_xhc) {

Both options look good to me; would be great _not_ to get this warning at
`dmesg -t --level=3Dalert,crit,err,warn`.

Thanks a lot!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
