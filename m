Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398844FC62B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 22:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiDKUxX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 16:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiDKUxW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 16:53:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FD41BE8D
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 13:51:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 575E861651
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 20:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2923C385AF
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710266;
        bh=hRWUE3+0f06fs9OYlTTb1gsip/BakK7yVMZPCSt60e4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Qzdryen8jIo7EA20ZMEyyYRmENtz86Bmq8fV8quj3wNC/B7/ieL4Nhcp3kZ8eUzJI
         XjhMU+8gDsjFdbZ1+3ocBGZOt/BwPw49dxShtU6dxejIvah4ajzqHDypTeA9ghbRAa
         mm2QPbMK4Zy71MxpxT+1WDyLt4C0ownndCqeYMhDgTQz5/wvqOmJiW94bTJrpSmk73
         o/E4nE1E/oh58fmvw4s6286l/ACT6WG+bnCJVW7Mmk7eG17Yw6qrS3nlV/ZWpTVncA
         adM82TZO2s1CXMpjy3biYu32rpSZmMz4nSXBdJCA538H5gKLQg8hXkjwYtUTE7WB+N
         6yOLpGISZdbhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 998CFCC13B0; Mon, 11 Apr 2022 20:51:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 11 Apr 2022 20:51:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-li0tIl8jCp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #12 from grzegorz.alibozek@gmail.com ---
(In reply to M=C3=A9ven Car from comment #7)
> I have this naive patch that fix the main issue:
>=20
> diff --git drivers/usb/typec/ucsi/ucsi.c drivers/usb/typec/ucsi/ucsi.c
> index d0c63afaf345..a679359c98be 100644
> --- drivers/usb/typec/ucsi/ucsi.c
> +++ drivers/usb/typec/ucsi/ucsi.c
> @@ -187,11 +187,22 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
>  int ucsi_resume(struct ucsi *ucsi)
>  {
>         u64 command;
> +       int ret;
> +       int i;
>=20=20
>         /* Restore UCSI notification enable mask after system resume */
>         command =3D UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>=20=20
> -       return ucsi_send_command(ucsi, command, NULL, 0);
> +       ret =3D ucsi_send_command(ucsi, command, NULL, 0);
> +       if (ret)
> +               return ret;
> +
> +       /* update all connectors */
> +       for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> +               ucsi_connector_change(ucsi, i);
> +       }
> +
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_resume);
>  /*
> -------------------------------------------------------------------------=
- */
>=20
>=20
> Will probably post to LKML

any update about your fix?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
