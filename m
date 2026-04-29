Return-Path: <linux-usb+bounces-36715-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGF4CI9h8mlNqgEAu9opvQ
	(envelope-from <linux-usb+bounces-36715-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:52:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B5499E5C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54F8F305E12A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3238E13F;
	Wed, 29 Apr 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQC148yX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4137BE94
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492343; cv=none; b=GlXOzF+ahIIWarymHY5Zf2NU/P3ee8oGjyWejaNuU2eg96gWMuGBlhDhL41Pji/QHXwdMtc08xw0aRdz62pepq1+pVcWQiZyUhB9qnpCbhBIlCJc8GyeYzvLShh/sy5AxhgT/aTnmFrRzXgX/gCG2D4xrt/lkfVwtSrBHcEmTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492343; c=relaxed/simple;
	bh=5r3l8xX9fZjsfpB6t1cwyBTKXnpt0NB/iEENU/iC7sE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=m4TzeHu5N8wMGwEsi7wx5tuPjNmNqk4fMdmwbPj5akndoORqcJqL9gsFeFCUCGlCkaqTzqu0N0vkC+dhss/PmLx5RZnGIg2EqHXNpBK4ADKvli2J2Azfb+io0I7gTaJpSLFKUhpoYfdpZQnjL8k1bLJNH/37Hr0dn9fKHUzf/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQC148yX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba895adfeaso269713eec.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777492341; x=1778097141; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JjLvz9pyZOo1IPWzSyWeI2E6gafL7pVEkrIJa1tUCM=;
        b=DQC148yXab+SZGs8FBrbb97kT9Iz3Amy5KVWkQvGVYCzosTuM0zAkt7urpHn2p8DMy
         VHwusfqLAjod50NMyHLyglAa50H7es2nx7WpRjBERVBeaBcF+CSCllf7OJW7o8Qm0ZJD
         vtFl73A9Ki1FXhB4Da4tnSahSQvL85MbA7oTWtO3/NEuyy500eMWNFicm4Z9I2Ai9xZj
         76mCdSHxJMBd96dbkrp5oS4dk0lxUG7dhfNgi68ucaGVAcldoMM9/wDcq3TvTy+0cwcx
         aLLdpL55Ilwzcjkvp1WbM8n3dw1mBFwVvACthfkh8I4tV2Zp3DHNe+Nv1sG+72W1X8i/
         OH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777492341; x=1778097141;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JjLvz9pyZOo1IPWzSyWeI2E6gafL7pVEkrIJa1tUCM=;
        b=mlaJPpDXjIqbBPbnUWXhRtypcr1Nc8fiFejMwBmIlUZvKuUE95wOP8H+0rAByin38s
         oPc7P4XmUqf7t6mzjEHkFfmblfNPYLIczkQxgAHNB5Y++dqBqD2pq9fvj308gvWCKLMc
         hQxygyKo+oN1OgmOWx7Lva7Vb1nCyJ2h9bf6DNict6QN5+iWLX09FwvgnLrnh+9tKpzl
         ChxxHol+Rq++w9JkM/ljwKb2mn8IQEolDaUVWZzG/YuAPeXfeUiyVJNTL2B/FqZbkufB
         tGd+H8qut5XvnblvCinedEEk8MrghXaZlNagbi4VpFdOZfv+sG485VFparX8RC50rvJA
         wayA==
X-Forwarded-Encrypted: i=1; AFNElJ/pNWRlFKLYsVhfqndegTtPdlBZF4aqZgDYwuN7gJ72gMeADdrvtzUsZZaHPwIgULfA/ypU7Z5uRj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsM1l3jeDz2azCn9Ausf6qvgq8ixHjlVuUYU3ATSXrqukpOzE+
	z7GLvQA3GrcQG5XcDGCKDebjBSdpGqIEMONqBIqW02wGVV1KLzzXfRm0
X-Gm-Gg: AeBDieuP2kd/DzJ+43gdh50qbOFA0qRCxsWLVHHa4j0/CCFGtA5ZHht3nMJWhvZy30O
	vZqrve8eDLSdN9puHorP5wMW0UBVBqIEsAxWw6zw9SSFGEEDrqbB25TY/TsyR0FDhX2F8/t0W7E
	u180LjYOHAuKMi/HLWrq+h9u2XYGsDVzsJ4Fv9y6Qp8zuRlRO2gc0HIubEG6ORYyhfWzndYBE5l
	3F0qtDF1kGhjAOJr14zltx2FcSA4HcHgfW73dMyXW0X5CNkqfHlxwj/uoM2qTIP6bQYTUQqSTcv
	eBF0GPeUyifRH+Grn3w7rDlhy/CGMivW4Nuf2XcwDXcqsocG55Tqsq1VcVq1uD2yHDASNlKUO/4
	N0WChT9Ew74x0FT2BCCpxVJ6xL25/rX1IyKPzL/4nkjO/euTr9gIRxlzSf91tDYu8DH2yoYiJTf
	sgMsgJyS0XRJa6NEDmvxxSv/A8UL6QV2j4sgVW0VQvF8QV6O+f3WbeQv/s/g==
X-Received: by 2002:a05:7300:7494:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-2ed19719901mr2619605eec.7.1777492341209;
        Wed, 29 Apr 2026 12:52:21 -0700 (PDT)
Received: from smtpclient.apple ([2601:644:601:140:91ee:85d1:baf3:f8b6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d391sm4924219eec.6.2026.04.29.12.52.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2026 12:52:20 -0700 (PDT)
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
In-Reply-To: <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
Date: Wed, 29 Apr 2026 12:52:09 -0700
Cc: Michal Pecio <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <229BBA08-3CF9-4E01-9621-1BD4A82BCD14@gmail.com>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
 <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
 <20260429212408.299826a4.michal.pecio@gmail.com>
 <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Rspamd-Queue-Id: 741B5499E5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36715-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]

> In the future, please tell your email client to wrap text lines after =
72=20
> columns or thereabouts.  Single-line paragraphs are hard to deal with.
Roger that

>>> I recently encountered the ENOSPC error mentioned here
>>> (https://lkml.org/lkml/2013/2/19/482) when trying to communicate
>>> with a full-speed peripheral with one isochronous=E2=80=93in =
endpoint with
>>> a wMaxPacketSize of 1023.  N.b., that patch was reverted
>>> (https://lkml.org/lkml/2013/6/18/458).  I think it should be tried
>>> again with a different approach.
>=20
> Out of curiosity, what sort of device? This bug used to annoy me too =
at
> one point, but my device was a DSL modem, not easy to experiment with.

It is an open-source oscilloscope/function generator/spectrum
analyzer/logic analyzer called Labrador (https://espotek.com/labrador/)


> Does anyone understand why the previous attempt at enabling 1023 byte
> isoc IN resulted in isoc OUT corruption?

I haven't been able to figure it out.  At first I thought that maybe it
led to SSPLITs being illegally scheduled in Y6 (USB-2 spec 11.18.14.1),
but I think that "if ((start % 8) >=3D 6) continue;" near line 1525 of
ehci-sched.c prevents that.  I checked, and that line was also in the
kernel at the time of the patch.


> BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next frame?
> It's an edge case which likely won't occur with one 1023 byte =
endpoint,
> but it may occur with more periodic endpoints and unlucky bit stuffing
> or with periodic BW limit carefully increased for testing purposes.

Yes, I am also worried about edge cases that could potentially crop up
as a result of my proposed patch.  With the patch, for one 1023-byte
isochronous-in endpoint, the CSPLIT mask is 11111100 and the SSPLIT mask
is 00000001.  I gleaned these from the debug log "ep 81: reserve iso @
0+8 (0.0+1) [1/21 us] mask fc01".  By all indications, the right-most
bit is earliest in time in these masks.  Also, I'm nearly certain that
these are in H-frame terms, as opposed to B-frame terms (illustrated in
Fig 4-21 of the EHCI-1 spec). This CSPLIT mask is consistent with the
first sentence of 11.18.4.3.c in USB-2, "For isochronous IN full-speed
transactions, for each microframe in which the full-speed transaction is
budgeted, a complete-split must be scheduled for each following
microframe. "  Ceil(1023/188)=3D6, so the transaction is budgeted to run
in uframes 1-6 (0-indexed H_frame terms), and csplits are appropriately
scheduled in uframes 2-7.  However, according to paragraph 3 of
11.18.4.3.c, an additional csplit should be scheduled in Y0 of the next
frame - I'm guessing this is the sort of thing that would require an
FSTN?  And maybe not following this rule could lead to problems if there
are other transactions in the pipeline?

There are a few other things that I'm trying to figure out.  The "case =
2b"
bullet point of 4.12.13.1 of the EHCI-1 spec says that "This case can
only occur for a very large isochronous IN... Software must enforce this
rule by scheduling the large transaction first. Large is defined to be
anything larger than 579 byte maximum packet size."  Is this being
enforced at the moment in ehci-sched.c?  I could see it possibly
becoming relevant if ehci-sched.c becomes more permissive towards large
transactions.  Tangentially, why are there no csplits scheduled for the
458-byte transaction enumerated in
https://bugzilla.kernel.org/show_bug.cgi?id=3D218544  ?  Tracing through
the ehci-sched.c code, I cannot figure out how you don't get at least
3=3Dceil(458 * 7/6 / 188) 1s in the csplit mask.



