Return-Path: <linux-usb+bounces-35342-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DKiCtOFwWn+TgQAu9opvQ
	(envelope-from <linux-usb+bounces-35342-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:26:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54E2FB411
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBB2D3105F3F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 17:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB7C3C0638;
	Mon, 23 Mar 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt4PgJvY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E425626F2AF
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285901; cv=pass; b=lbTmwFmBy7qtJbP2g+fve5XcQz5or8toyG8GtXQWes1LwQAjL4uHkMHUQ3uoJT6lypKHKuVJO/G8LOWvWk7IYbVjpSzIAZOF8ZMSdDILe7vjxjv+MtBVn5eV1wrbZx0Z4f+I5YMW05ObdWqXMVu2ERZVkQfZ4NufIbDGP2TIkI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285901; c=relaxed/simple;
	bh=71cSsY+1LDFRL91FKXwp5TAsrbyMr683Ah+dE3YjAH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYLGnOw44gTd1EFEWegzAbc+BLJ1pnGG+Ot6td9442RSCtDx5CQlGe1FNcByiMWUhyRSzfQJg4hjoBKdQzobl/+cKhcvEOdgp5MFaZ9JogDEv6nsuaG8wrrkUOqwQvQDb1Gc3J7mWHqo56bpEUaIB1XwlEdHAfN5Ydo9b6d76UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt4PgJvY; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b35f3e489so31167361cf.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 10:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774285899; cv=none;
        d=google.com; s=arc-20240605;
        b=NJmys1mhjjVBk0TkKGPn/nS+aFtK20owhtdtisEHstPDcJEyhdAuqxS3YPzHrsjxzZ
         J9WfZjbtqBzVZMIrgW7wQuFR7BsEY+MWBL6qbcz40k70zpPoFR3SpD3CVdz6fxrI82i0
         0xp0DHwkoJP6o1cdxCr0g/JkhyXFLr2eiCafcQO82mKI7w9h7rBWPd6A98+pC8f+3/fh
         iHoQDUuqdBXm5ahutTMp4xtKNqjyFEht4cpvYRhq9iqvLDrhmMn7n8XtQqKVA3yYcrrM
         DK4XxiXsiaOuGmD1cPGCGro+tFveit3thJT8VpFtvs/uwexTSjhVrC3zoV27ipqCqC3Q
         DrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iRqym/SYCBxPgS5kPiCro33o+ZN+dD8ItlnNTykfAZ0=;
        fh=RJk+pZqpqHiQVCVuJD0Zn0GPfBYL6VTxd4FySlr35Q8=;
        b=jS3bNhb4u9jTN23H7j5rcF9VPIcStWIPcgU77IiNKfp3iE+0ukSN4yrK1imaH8CeQk
         T7BGNRpXyp4a/k5zT3Cr5DIYUY/q7J0ELbPEnW4W0pBIbHksp/PpmcPCD0WDCTxjWHzn
         p0y4CUt/5C/7YEw1mflJEa6zAdXx52BPsNNRqPCCEKyh+gu8gNJba/iwgI89VNKX/sgK
         I4mXN+2wwpvJprHDIHrla+yb7mu7DxgY7XENLpC4qgsz9GUiXRUAQzFyOZb4Ez+VV5GE
         E1oIWWywtQvT8Rzzegm8uAsRoDye3wPLOskGgttOYQPv0c2Hc1Jzgxs6Suf49rg5WAnI
         EHuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285899; x=1774890699; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iRqym/SYCBxPgS5kPiCro33o+ZN+dD8ItlnNTykfAZ0=;
        b=Bt4PgJvY1vVVzoF9Pik2J5jYU4Vq8NaE/xBEduhxAOfSOjoMMX3YLg7IdCMW5eZK1Z
         IH/4S7j1RsuZvORjipX4WgB2H7CortmrXdcl7MHoU2puolj/ptiuh+70BpOYdASqbOPe
         NXcasJ8aQAQtjtrKrpPywWCpjHvbpo0wacRac4U2RYDHW9m1hTjKY+qfZcPVfFyEd7bv
         LNdoGruHSJkYuFeHMKgqJHyjq3MStEu2fGf6YCOWn1AQmDBH4s6LYW2C9CsCVbmTEgle
         1aUbVr54Zd8V331FPIw/dgXVue6X9m+SOJhZmvq2ZXvrQjsDPnKV69MSYvegJdopOrDj
         S3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285899; x=1774890699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRqym/SYCBxPgS5kPiCro33o+ZN+dD8ItlnNTykfAZ0=;
        b=oiefWnPOcVq0gwX26GMfkohatRdvpv8LflQPw8UPJMkx2CbiDWucfnLeYiXuGJAHLr
         e0OQ8W+UlOve8CjjhhVqfuvD7fCTWXUvnml0g/w6Vx1b+ztCrPzWLaPVquHArD6XuJdX
         dTp6+PnrbHOeH2QDHOjlwb72FEROWja+jgGRsbpVv0CQ4X2RhWWYSAvw1PgXclNazDEF
         y7Ge8P78dTUKLd8SgItLqWId0tz3cy/Mqm7Jr/enh6/Q29vAuV10rZTuHowNSk+zFkqH
         RBeCEy3NwpLpfkYfjF0Ipvffpjx3BPpIhALq6V2MHxPd2xNfpnXrn7kcArdLB0cneArJ
         vYjw==
X-Gm-Message-State: AOJu0Ywfak6JEenhE0xbXVrWJMwYeehT3eAhRUU+36wdczua/GL6HnT4
	qcyXnmsZ9+HsP9fH/nURgfkRTHN8ArsIlEaeZ01hZRTNJV7Q5Lyp5WOY1mC2fOFB8Nrsi0PGSpY
	uzT1vKdCfrViXrzK4PE2z5Suhq16YbYw=
X-Gm-Gg: ATEYQzxvocCR7UwFYSSR/PmyP3Oi1bTh8REaNZXUqrab81OgRBnONIqjY5fLSuubBzU
	J9hqix9uDTtOSxcsJzLD0PUYf3z6fpq7DKbG6n5lKQavUwSuhbMTaxHk2PkL4n7LXz7+B0/mpQs
	ZadunS0DR0Gjdlwnr0azz5oVqYOX2NyZfC1CvGNvJCv/7dIyqhG4wctmbS+qk+dDUvu/Ur8c4rh
	boacg6Nk6VU0M/cKiPxSEHWewKU2LHgeP71JM6RL3hLm9JGSAZf23STrr6Ew1weN00tvgL4gB9N
	c3rnyVKzGJEj0u1dOOU6fdrNV5oomKkcV7Vn1zIRLZHRRtAFST0sFJLeVuzk2fqLyytPixurRsy
	fLeWvkleKxC5agfe1K6wKlmBr
X-Received: by 2002:a05:622a:1f14:b0:50b:2fcb:9891 with SMTP id
 d75a77b69052e-50b6ebf034bmr6583001cf.0.1774285898607; Mon, 23 Mar 2026
 10:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
 <2026032337-resend-recolor-efc5@gregkh>
In-Reply-To: <2026032337-resend-recolor-efc5@gregkh>
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Mon, 23 Mar 2026 18:11:27 +0100
X-Gm-Features: AaiRm53yhKtG1QdZqn6qyMF3pRwVV6oZErkKW_7jyWcX_L6lgA2r56Qh-BFiXWY
Message-ID: <CAN9vWD+N6K4VExNgnhp=amfBDJTFN9Sz156qsy550dP-d1S9Qw@mail.gmail.com>
Subject: Re: Oops when rebinding f_hid while /dev/hidg* is still opened
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35342-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8B54E2FB411
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> This bug has happened a lot on many gadget drivers, I think we fixed a
> bunch of them already, can you verify this is still an issue on the
> latest 7.0-rc4 or 6.19.y kernel release (6.17 is very old and obsolete
> and insecure, don't run that thing...)

Apparently, Fedora updates their images very rarely and they need a
package manager update, sorry about that.

I now tested it 6.19.8-200.fc43.aarch64 and the bug is still there. I
then switched to testing with buildroot, because that makes it easier
to test different kernel versions. There, the behavior is a bit
different but there's still a bug: Instead of immediately triggering
an oops, everything appears fine on the first run of my script. But on
the second run I see this:
[   81.514126] refcount_t: underflow; use-after-free.
[   81.519000] WARNING: lib/refcount.c:28 at
refcount_warn_saturate+0xf4/0x150, CPU#2: bash/176
[   81.527501] Modules linked in: usb_f_hid libcomposite
[   81.532613] CPU: 2 UID: 0 PID: 176 Comm: bash Not tainted 7.0-rc5 #2 PREEMPT
[   81.539749] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
[   81.545654] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   81.552704] pc : refcount_warn_saturate+0xf4/0x150
[   81.557550] lr : refcount_warn_saturate+0xf4/0x150
[   81.562398] sp : ffff800080613a90
[   81.565746] x29: ffff800080613a90 x28: ffff0000048d0f40 x27: 0000000000000000
[   81.572973] x26: 0000000000000000 x25: 0000000000000000 x24: ffff000003e22000
[   81.580199] x23: ffff000003f39a80 x22: ffff000003e22618 x21: ffff000003f39968
[   81.587425] x20: ffff000003e22c58 x19: ffff000003e22c58 x18: ffff80008061367f
[   81.594653] x17: 0000000000000000 x16: ffffba3cf8d80650 x15: 072007200720072e
[   81.601879] x14: 0765076507720766 x13: 072007200720072e x12: ffffba3cfac96be8
[   81.609105] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffba3cfac96be8
[   81.616332] x8 : 0000000000000102 x7 : ffffba3cfaceebe8 x6 : ffffba3cfaceebe8
[   81.623558] x5 : 0000000000017fe8 x4 : 0000000000000000 x3 : 0000000000000000
[   81.630785] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000048d0f40
[   81.638012] Call trace:
[   81.640479]  refcount_warn_saturate+0xf4/0x150 (P)
[   81.645326]  kobject_put+0x108/0x110
[   81.648938]  cdev_device_del+0x50/0x60
[   81.652728]  hidg_unbind+0x24/0x50 [usb_f_hid]
[   81.657222]  purge_configs_funcs+0x7c/0xe0 [libcomposite]
[   81.662686]  configfs_composite_unbind+0x5c/0xb0 [libcomposite]
[   81.668680]  gadget_unbind_driver+0x7c/0x120
[   81.672997]  device_remove+0x4c/0x80
[   81.676610]  device_release_driver_internal+0x1cc/0x230
[   81.681898]  driver_detach+0x4c/0xa0
[   81.685511]  bus_remove_driver+0x6c/0xc0
[   81.689478]  driver_unregister+0x30/0x60
[   81.693443]  usb_gadget_unregister_driver+0x20/0x40
[   81.698379]  gadget_dev_desc_UDC_store+0xb4/0x140 [libcomposite]
[   81.704459]  configfs_write_iter+0xc4/0x120
[   81.708690]  vfs_write+0x244/0x370
[   81.712127]  ksys_write+0x70/0x110
[   81.715564]  __arm64_sys_write+0x1c/0x30
[   81.719529]  invoke_syscall+0x48/0x110
[   81.723319]  el0_svc_common.constprop.0+0x40/0xe0
[   81.728077]  do_el0_svc+0x1c/0x30
[   81.731426]  el0_svc+0x34/0x110
[   81.734599]  el0t_64_sync_handler+0xa0/0xf0
[   81.738829]  el0t_64_sync+0x198/0x19c

I get this with both 6.19.8 and 7.0-rc5 on buildroot. I guess there's
some randomness to this bug and the different kernel config changes
the outcome a little bit.

Thanks
Michael

