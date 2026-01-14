Return-Path: <linux-usb+bounces-32330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA0D1F001
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 14:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7597F303889D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852F0399A5E;
	Wed, 14 Jan 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LndXLgjW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EB389E1A
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396184; cv=none; b=Niz4cG/gT3JUIiFL3/GrFkICYRrbzrp/kSixjXxPMeXgXLNOdaBDuxQbZ6uRYcDt5Z6vN5Te2oecKCA2Zg9i+T1ICT72WNu0PLZPC0ma9Ph2JxU+yEXRRxr5Ucun/XQFhFxMIaqh2xLu5d6+PoNsXNTrR/a2u9S1wcKgHeFTg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396184; c=relaxed/simple;
	bh=jdbPctqdhCzGnxQd5VqVN+uif8vKWwD02EUlp9zSQOA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C/24QdODSfjfcBynHkgTpHmCCiApsXgHbdVSp04/qODiQkIr5umMogh7zde2zQe0QPRFRo2u2sSPWpxhgu/9tW+MAn/sv1cgnUgBhKHofvYvcyTgpHAqXzxbezbWMyH7zOGb5tqVX0Oh0TZ3TIkkBdUEEh5jTZH4NmqP8ab3nEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LndXLgjW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A94C0C4CEF7
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396183;
	bh=jdbPctqdhCzGnxQd5VqVN+uif8vKWwD02EUlp9zSQOA=;
	h=From:To:Subject:Date:From;
	b=LndXLgjWelIUB99eeNU/a6qOWWS9KKG9dY7s/fzOHLehE150EcdCKGUkrGxTkqXBi
	 RXD5rnme+P/XVqrvItZfR7UoEMG21PAwOdmouLR6ZU4J2CllmS48SIgBVD/vuHzGIw
	 +gGv5AdZNlJBKmVXOIMVsQGQ/7cEsEXd2pz6ssF/oTl3Fu5nR39LJqvVn/MDhxbNAE
	 MNgxJ3JXeEBR3+I1LZJu/6Mn30qaLdg1jlOWPzGpiv5dtMxxmfiSKnkoSboDrmJHJG
	 NLIj3F1e0YXq/i0a838jEoFSsgNUsIkOcrn48TEu9TtyIvUdKoj6LMQvQN5G07nRql
	 afPHvZEFgOFzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 970E3C4160E; Wed, 14 Jan 2026 13:09:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220981] New: Potential data race in
 drivers/usb/class/cdc-wdm.c::wdm_read
Date: Wed, 14 Jan 2026 13:09:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: franci.vi@tiscali.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220981-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220981

            Bug ID: 220981
           Summary: Potential data race in
                    drivers/usb/class/cdc-wdm.c::wdm_read
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: franci.vi@tiscali.it
        Regression: No

This issue is related to https://bugzilla.kernel.org/show_bug.cgi?id=3D2208=
57
where a tool was used to detect possible TOCTOUs.
A list of affected source files is attached there: among those
drivers/usb/class/cdc-wdm.c


By looking at wdm_read() implementation:
wdm_read() copies data from desc->ubuf to userspace through copy_to_user(),
without holding the spin-lock desc->iuspin,
while the RX completion handler wdm_in_callback() may simultaneously write
desc->ubuf under the same spin-lock.


A possible fix could be:

1) grab desc->iuspin before we get the amount of data desc->length and befo=
re
we access desc->ubuf.
2) copy the requested bytes into a temporary kernel buffer while still
holding the spin-lock, then update desc->ubuf/desc->length.
3) drop the spin-lock and perform the copy_to_user().
Handle the case where the buffer desc->ubuf became empty after we took the
lock.

Below the full implementation of wdm_read().

static ssize_t wdm_read
(struct file *file, char __user *buffer, size_t count, loff_t *ppos)
{
        int rv, cntr;
        int i =3D 0;
        struct wdm_device *desc =3D file->private_data;
        u8 *kbuf =3D NULL;                /* temporary copy of data */

again:
        rv =3D mutex_lock_interruptible(&desc->rlock); /* concurrent reads =
*/
        if (rv < 0)
                return -ERESTARTSYS;

        cntr =3D READ_ONCE(desc->length);
        if (cntr =3D=3D 0) {
                desc->read =3D 0;
retry:
                if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
                        rv =3D -ENODEV;
                        goto err;
                }
                if (test_bit(WDM_OVERFLOW, &desc->flags)) {
                        clear_bit(WDM_OVERFLOW, &desc->flags);
                        rv =3D -ENOBUFS;
                        goto err;
                }
                i++;
                if (file->f_flags & O_NONBLOCK) {
                        if (!test_bit(WDM_READ, &desc->flags)) {
                                rv =3D -EAGAIN;
                                goto err;
                        }
                        rv =3D 0;
                } else {
                        rv =3D wait_event_interruptible(desc->wait,
                                test_bit(WDM_READ, &desc->flags));
                }

                /* may have happened while we slept */
                if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
                        rv =3D -ENODEV;
                        goto err;
                }
                if (test_bit(WDM_RESETTING, &desc->flags)) {
                        rv =3D -EIO;
                        goto err;
                }
                usb_mark_last_busy(interface_to_usbdev(desc->intf));
                if (rv < 0) {
                        rv =3D -ERESTARTSYS;
                        goto err;
                }

                spin_lock_irq(&desc->iuspin);

                if (desc->rerr) { /* read completed, error happened */
                        rv =3D usb_translate_errors(desc->rerr);
                        desc->rerr =3D 0;
                        spin_unlock_irq(&desc->iuspin);
                        goto err;
                }
                /*
                 * recheck whether we've lost the race
                 * against the completion handler
                 */
                if (!test_bit(WDM_READ, &desc->flags)) { /* lost race */
                        spin_unlock_irq(&desc->iuspin);
                        goto retry;
                }

                cntr =3D desc->length;
                spin_unlock_irq(&desc->iuspin);
        }

        if (cntr > count)
                cntr =3D count;

        /* allocate temporary buffer before taking spinlock */
        kbuf =3D kmalloc(cntr, GFP_KERNEL);
        if (!kbuf) {
                rv =3D -ENOMEM;
                goto err;
        }

        spin_lock_irq(&desc->iuspin);

        /* re-verify data availability after taking the lock */
        if (desc->length =3D=3D 0) {
                spin_unlock_irq(&desc->iuspin);
                kfree(kbuf);
                goto again;
        }

        if (cntr > desc->length)
                cntr =3D desc->length;

        memcpy(kbuf, desc->ubuf, cntr);

        for (i =3D 0; i < desc->length - cntr; i++)
                desc->ubuf[i] =3D desc->ubuf[i + cntr];

        desc->length -=3D cntr;
        /* in case we had outstanding data */
        if (!desc->length) {
                clear_bit(WDM_READ, &desc->flags);
                service_outstanding_interrupt(desc);
        }

        spin_unlock_irq(&desc->iuspin);

        if (copy_to_user(buffer, kbuf, cntr)) {
                rv =3D -EFAULT;
        } else {
                rv =3D cntr;
        }

        kfree(kbuf);

err:
        mutex_unlock(&desc->rlock);
        return rv;
}


It is not possible for me to reproduce the possible issue, nor test the
solution, due to lack of necessary hardware.
Could someone confirm my understanding and if necessary take care?

Thanks in advance and
Best Regards,
Francesco

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

