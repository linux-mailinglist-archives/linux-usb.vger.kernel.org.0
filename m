Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDFB39924C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 20:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhFBSRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 14:17:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhFBSRK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 14:17:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 05B94606A5
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622657727;
        bh=Xz9ej9/0Q5AiUfvgYs/dVhcXsSoxIeo++HBiM9Xs2YQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XAeS44p+Us03ofb+CcupLkgBFuFSLwN8NMtQ2UHmbAB5vB6taNl2I6X4fUcPjsz9N
         fSaUhdGkcGQWbiFTtMJLIM3ufxA/8UDcXQ38IYx7zqnVJMQm0sphY+IUaN2maYgt17
         STD6g3kODidlTSreQly1tKmOAEtkGQPgqAr9K1ck7cXnGL4HUm9MpArQxi5PZtPg6w
         py+s2ZBtzXCc3H8MHiOaWIlMVInTu2kcaXQW9WhqFcFFK4/pjTnqjQZHCvumQFxXXf
         j6o7iKwwgRK22khbcrhzT0hjNOD2BdPoL0y/RNIfeUb+MtmwIv+az21eqI4OCGqk6B
         SvrlX99k91SaA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E7B7361167; Wed,  2 Jun 2021 18:15:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 02 Jun 2021 18:15:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-eCpCjBUvSI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #14 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Alan Stern from comment #13)
> THat commit you found, 51e6f07cb12e, cannot be the real culprit.  Merge
> commits don't change any code (as a general rule).  Something must have g=
one
> wrong with the bisection procedure.
>=20
> The way to test the result of a bisection is: First, check out the commit
> that the bisection identified, build it and boot that kernel, and verify
> that the problem occurs.  Second, check out the commit's parent (or revert
> the commit), build and boot the resulting kernel, and verify that the
> problem does not occur.
>=20
> One thing you could do is get a list of commits affecting the snd-ua101
> driver and try checking out and testing various ones, to find the first
> commit which exhibits the problem.

I probably was doing it wrong, then, but thought I was being quite thorough=
.=20
Here's the procedure I'd been following (probably from
https://git-scm.com/docs/git-bisect):

0. cd /usr/src/linux-next

0.1 On the first run, I ran these: "git bisect start", "git bisect bad", "g=
it
bisect good $OriginalKnownGoodVersion" (I think the original known good was
v5.12.0 or the first commit to 5.12.0)

1. Copy my .config file to the source directory, in case it changes with bi=
sect

2. make -j4 menuconfig, and then just exit and save, just to save .config w=
ith
any automatic changes needed for this source

3. Remove space hogs and any prior configuration: rm -r
/usr/src/linux-next/debian/ /boot/vmlinuz-5.12* /boot/initrd-5.12*
/usr/src/linux-image-5.12*

4. make -j4 deb-pkg

5. Install the kernel just built, and update grub accordingly: dpkg -i
../linux-image-5.12*_*.deb

6. Power off the computer

7. Power on and boot the new kernel

8. Test the bug (if its designation changes to "hw:USB1" I expect it'll be
working, but still test it): arecord -D hw:UA101 -f S24_3LE -r 48000 -c 2
./ua101.wav

9. If it records without the error: cd /usr/src/linux-next ; git bisect goo=
d,
Or with the error: cd /usr/sr/src/linux-next; git bisect bad

10. Repeat 1-10 until I got the output I gave you above.

I was under the assumption that running "git bisect {good,bad}" was enough =
to
checkout the next version that needed to be tested, and it seems that it mu=
st
have been. This is because I had quite a few that didn't work, then one that
did and another that didn't, eventually ending with the remaining few all
working.

If I, indeed, needed to be running checkout (as, say step 0.5),
/usr/src/linux-next/.git/refs/bisect contains a logged list of the first bad
and some good commits.  Reverting each commit previously tested (logged) and
retesting sounds even more time consuming, but if you don't mind waiting and
think it's necessary, I will continue this endeavor, and eventually get bac=
k to
you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
