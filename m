Return-Path: <linux-usb+bounces-36735-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFmqDs/68mnxwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36735-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:46:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBC49E38C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F0323009E0A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 06:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD12B375AD0;
	Thu, 30 Apr 2026 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+kJHwIV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777535A38C
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531591; cv=none; b=J1VqxVH6VHq3SeeBqGGUCIgg4TY/TSI0+4jUXZnyvewn1Gppcd10INyvbnb6weQeJ+xULWsEQRphgGr3sWDtGWWS3ueRIBlh/YEzFPFIYToCxp26hOtcK/rbGedT6mh4+PMylo8klGwOm5F3Zo8JuCtGnJGeLQlEQmCxT5Pt5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531591; c=relaxed/simple;
	bh=w0h/4AHYY7fbHcXypqa4xuyiswxnQMtf1P/N5Q+1QXg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RSEnX/mK8EaN5FeaVkQOa6R1I14joyVBoR4YbcJ83kklA8VrAtRc9geWvmFB6tIGktlc6Vv64rDEJWNZyg3H+lHRigpWzF/JgbXYTwARMEvTP2Jai3Kuj3fOyVDxfJ9QIubYFQ+IVonkaRCCgTDAiJ2D+4ouio13JhAkSEAcpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+kJHwIV; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso391140eec.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777531589; x=1778136389; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV5CQ+XE8ATI9LNtwrHAOK02HhjeNMCcT46+biOeiEE=;
        b=G+kJHwIV/5r8nIlSjZsLD0PBDFyVZ5NdPi/Aw8wxB5qGdkJt7QlixRJm+sN0WKre60
         2hwLtJ2fH3yiV+5bqLhwFWynJ0l1zrYshjGnsMrbOe2m1ZyTG20YZL8Ujfo7alovUvJS
         TOd/tDDt0yCOuRIcRfzNyfpmrDkbPuhwcp3yc1L7AfnjGBgrONwzJRMANVnngGxR/yAP
         y/YMIBT6r31f4nUaQ56rGD7Hyu99A+t9K4FMrt5L7twk+Ezx1jcSQGkJUn+raEVmKaPp
         o0FSte7ZbXKxxUyCEn73POzYniA3Z5WypAs5IZJobTKEaJtFkNE0Z8ba2ieIsE/YGr8v
         7GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777531589; x=1778136389;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eV5CQ+XE8ATI9LNtwrHAOK02HhjeNMCcT46+biOeiEE=;
        b=qH2UysI8SD6uBfjdDlkQJrgBQ+WCoOtalm+c6O1TNGiTlhOsId7Db3X4tjXlcb3hcL
         P9ziypLyX/VPIg/6dheMQ3u64TGd5KrI+5KiS7Q0GJW50MKZiNPAFOpkJoLxGTAHgFfM
         DbOgkCDiLGFcGeVRrrUM5hIrv8HIFEdNhmsSeiawXWh4+CdEuG16t098M9bBMqN8rcgw
         reiQzQFkU6002g8wsYwSLlTyV2HI39g3dgh3OlV2awt374uVQ0R+jqYXZVPoTAWDpXJv
         EAP2nEDnEwUv9OdN25DRTZrgEQE43KL8FLu8U0PVux/2ryKzcFXzNWVetmzS5kcmI9Jz
         gvaA==
X-Forwarded-Encrypted: i=1; AFNElJ+eJFHnZZA8gkfs4tnnjtzftibuzWo76nlj6n027uWKzdMFo//vKrQBnq8K34GqMEr/uFgKwO2O40k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYDikdSVqJPxcwgSi671qHQK/d/f/1OzJ7V1rEMHZbhxDWJRl
	NX19v2iZ6ITbyLRgJaEyCXqk1TI2xMBDeDoNhSInbjDyJ70fAc0ns3zp
X-Gm-Gg: AeBDieu/hmb5zM9ScY/AxwnK8QXn9fXLM0qUlwumMkfAAheTYoYsYtjuDFYoU466+ru
	GqUfFCSjddLVMoRzBnmDE29+iFvDX+gLmjHnNCSP71zZLeoWQ9glOdXyEiIFvSRKo4BLmqVqDG9
	TGGtBzbgNT33DLjhwsm5EAatgr7J67v0dSk1ygAOqOSnPO/yP00pctzBrqsMWTKPnqeRIkRuZRi
	Hb+6ot7+OqTuWahEz4AUnvrj3YO1uR4t0wsDpIH3UX3wioiF2Ec5PnCLJelXb2frqQG6vJDrrCc
	0JLaD28uB6mVOWcmZj6PtAO9beXShPEnLxGyB5Vqbz5HaligwWYN/9VkJhnTIDTYKBTfAa2u8OT
	pe5+5nDrXHO66fbUe04pLrDiKO5GN/48p3++BYiZBOaaXiBuqHbztP67O8iWAX6z1+rRh/vz5hF
	oXYpax+ak4W0bLbgZLSi4WmJZvl9cQOW+Fh1erirJDEoVdbm2GnhVEOz2Bhw==
X-Received: by 2002:a05:7300:2d24:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-2ed4d51476fmr595009eec.2.1777531588900;
        Wed, 29 Apr 2026 23:46:28 -0700 (PDT)
Received: from smtpclient.apple ([2601:644:601:140:201d:a35a:66e8:6eea])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8ddaasm5695491eec.7.2026.04.29.23.46.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 23:46:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: =?utf-8?Q?Re=3A_TT_budgeting_for_EHCI=3B_accommodate_1023-byte_fu?=
 =?utf-8?Q?ll-speed_isochronous=E2=80=93in_endpoints?=
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <0a09202c-cc15-4fc9-9102-701348050a79@rowland.harvard.edu>
Date: Wed, 29 Apr 2026 23:46:16 -0700
Cc: Michal Pecio <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF232958-2AD7-441B-8204-C668BBE75FDD@gmail.com>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
 <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
 <20260429212408.299826a4.michal.pecio@gmail.com>
 <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
 <229BBA08-3CF9-4E01-9621-1BD4A82BCD14@gmail.com>
 <0a09202c-cc15-4fc9-9102-701348050a79@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Queue-Id: 38EBC49E38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36735-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,harvard.edu:email]

> On Apr 29, 2026, at 7:27=E2=80=AFPM, Alan Stern =
<stern@rowland.harvard.edu> wrote:
>=20
>> an additional csplit should be scheduled in Y0 of the next
>> frame - I'm guessing this is the sort of thing that would require an
>> FSTN?
>=20
> No; FSTNs are for interrupt transfers.  But it would require extra =
siTD=20
> nodes with backpointers, complicating the allocation and deallocation=20=

> algorithms.  That wouldn't be so hard to add, but I have never felt =
the=20
> urge to do it.

Hmm, I may try to take a crack at it so that my previous proposal to =
inflate
the values of max_tt_usecs will always work if the bus just contains one
1023-byte iso-IN endpoint.  That is, the goal would be to fix

>> Then I think it doesn't support 1023 byte packets at all.
>> 1023/188=3D5.4 and if worst case bit stuffing factor is 7/6 then up
>> to 6.3 uframes of transfer time. Completion in Y5 or Y6 and CSPLIT
>> required in Y7. =20

__________________________

>> The "case 2b"bullet point of 4.12.13.1 of the EHCI-1 spec says that
>> "This case can only occur for a very large isochronous IN... Software
>> must enforce this rule by scheduling the large transaction first. =
Large
>> is defined to be anything larger than 579 byte maximum packet size."
>> Is this being enforced at the moment in ehci-sched.c?
>=20
> I don't think so.  Bandwidth is allocated to endpoints as they are=20
> added, and the driver does not go back and try to rearrange the =
schedule=20
> if something doesn't fit right.  It most certainly does not try to=20
> change the allocation for endpoints that are currently in use.

It might be easy to do now that the budgeting is done working backwards
starting with the latest uframe (as of
https://marc.info/?l=3Dlinux-usb&m=3D131973404328622).  Pretty much, if =
the
byte count exceeds 579, see if the transaction can fit starting in
uframe 0.  If not, because the scheduling worked backwards to begin
with, there's no way that the schedule could be re-arranged to make the
large transaction fit while obeying the quoted rule.

Clearly, 579 is just about half the 1157
maximum_periodic_bytes_per_frame mentioned in 11.18.1, but I can't think
of why that's the threshold for a large transaction.  Sure, the
threshold guarantees that having 2 large transactions is impossible, but
that still doesn't seem to be important in the context of the reasoning
given in EHCI-1: 4.12.13.1.

>> Tangentially, why are there no csplits scheduled for the
>> 458-byte transaction enumerated in
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D218544  ?  Tracing =
through
>> the ehci-sched.c code, I cannot figure out how you don't get at least
>> 3=3Dceil(458 * 7/6 / 188) 1s in the csplit mask.
>=20
> Was that an isochronous-OUT transaction?  Those things don't use =
CSPLITs=20
> at all.

Ah yeah, it was an iso-OUT.

From,
Brent Page


