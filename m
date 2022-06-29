Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E08BA560AA6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 21:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiF2Tu1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 15:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiF2Tu0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 15:50:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4F01DA41
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 12:50:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB9BE620B3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 19:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B64C341D0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 19:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656532224;
        bh=C1Hx7QGYfe/TNb7bh5gkBUaQSqWGTeHaICV8YwAiQwM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E1c6tF3KwaDaTIvyEWsqWw1uSPpjI42QAZNJ+4+ZZJdBUhpS7lt15d5Evw4h/cUxC
         jOuPd3rxUgNeGqy2kMcRmeyT8CGL/dkDF6ov4AzEAFGpHX/1sFUq0TvOmRlSEfKt+K
         E/sl6JUkR212pckK9+4B0pxkVX7i9AP3UR/wgXak27AtGiLC9lDsxQYYzScF407T6K
         lyLmC+yeXAQTIZm6leJs7QX+PAdXEpTV3If5qYuKkuZ/g0nt5wAJTNIkAaaOU5WKI7
         B7bzZavC48qDxhjTu9tVjn8GiPOxIUVQFAXPUrJg+dwJG3Vyf1o+sqqDBHu3vnlJiY
         jC1KaCH23TUXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 43BBBCC13B3; Wed, 29 Jun 2022 19:50:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 29 Jun 2022 19:50:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: meven29@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-JjxDlH30og@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #19 from M=C3=A9ven Car (meven29@gmail.com) ---
(In reply to grzegorz.alibozek from comment #12)
> (In reply to M=C3=A9ven Car from comment #7)
> > I have this naive patch that fix the main issue:
> >=20
> > diff --git drivers/usb/typec/ucsi/ucsi.c drivers/usb/typec/ucsi/ucsi.c
> > index d0c63afaf345..a679359c98be 100644
> > --- drivers/usb/typec/ucsi/ucsi.c
> > +++ drivers/usb/typec/ucsi/ucsi.c
> > @@ -187,11 +187,22 @@ EXPORT_SYMBOL_GPL(ucsi_send_command);
> >  int ucsi_resume(struct ucsi *ucsi)
> >  {
> >         u64 command;
> > +       int ret;
> > +       int i;
> >=20=20
> >         /* Restore UCSI notification enable mask after system resume */
> >         command =3D UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
> >=20=20
> > -       return ucsi_send_command(ucsi, command, NULL, 0);
> > +       ret =3D ucsi_send_command(ucsi, command, NULL, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* update all connectors */
> > +       for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> > +               ucsi_connector_change(ucsi, i);
> > +       }
> > +
> > +       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(ucsi_resume);
> >  /*
> > -----------------------------------------------------------------------=
---
> */
> >=20
> >=20
> > Will probably post to LKML
>=20
> any update about your fix?

I was wrong, I did not test properly, or at least I am unsure.
I am not familiar with the code base and it would take a long to learn about
the API to properly find a proper solution.=20

I hope a usci maintainer will have a look.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
