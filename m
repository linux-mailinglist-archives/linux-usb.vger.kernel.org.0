Return-Path: <linux-usb+bounces-36090-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uICaLDdd12kCNAgAu9opvQ
	(envelope-from <linux-usb+bounces-36090-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:03:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D26A93C76B0
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8B383007A78
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 08:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CD838C2DE;
	Thu,  9 Apr 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Niq4Qc+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436537883C
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721775; cv=none; b=jLgTBXgDxvk52/AqoFuelmCsy0rzrJ0ACwzkKU5vvEBDxUMtrQroANk89wfR9gj0lrNLuI1dG0//dbXCpwbXAypegk9yh2HVENX9jXg0jPmJE+ciPoArKvQ/U2cxJFjMmOwydS9w+m5wUGTx5YoD0IB/OdYL7Tvhge0odkxrsRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721775; c=relaxed/simple;
	bh=0Ogc9JSBBGwGPjCCTbrNaU1DTQCu5wAABvOqgchMBC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjbxqVhhKJ8qrPPMBgqSUZEbFvDpvSC1SRH/Oq07PEX1H/NsAilVTpoUk0csw4bhKhAOLIeBZkDjW94+tQ0mNRU3H2Zr3voekgWoYdAym8mcn+v2Q3mRknTSJgAZsHqh0vc/BOQxwXYEIonOrvbDOeS0dVxJNExkzdusIv0UmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Niq4Qc+D; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so294263f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775721773; x=1776326573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s86D+DhGHsIGvz0sr+SSnyTaFHdgNLB1XeFc1X3fVU=;
        b=Niq4Qc+D2nv17obUxhZIeefeZtPwo6gAuQFFehxcFHqJdDW1xBIFJFpENtYwG8bwUB
         h8uCiRm1NfT3Qwo1GzLzvmV4LtW9uGWj0wVqd6pGs+mP7oRBxKLtjG8PJ8NoLXudfpEV
         39K4S0tNwbfwf7peK6prZL1JpvLc8tW4hu/TA2B+oc4QYvTIqb7WD0+22udNfDutAVYB
         fAT1cL+YXy8a2u4qcx3iRloMpwTSh5A8+20i6wBbUDE2+vcw0D95NmuaGa+aB13yIRNR
         /1xgQd8ls/9cihFMwf2jNT6aBZPx78A4WddH1t+g/d/w1Dk2MMF932Eb/ACtVR8Fqyvn
         /kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721773; x=1776326573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9s86D+DhGHsIGvz0sr+SSnyTaFHdgNLB1XeFc1X3fVU=;
        b=GW+hPls5endwCwwo1vdzoJYV1z6uHM12RMgPOJlfcq9HzjH+jvXsDN4ZI6wfTUYLUF
         /oxz8rKejntwcB+bfwsXe/JMEkYaJNXYRtPKL77/7ax131r59Errd8kxFB/+0/peHXLm
         uFxnn3P6AO0FEk3kQdBe0x+46sl9C+GO2MazAZ0r2XrKL0ksoWgilWQMPIBEnf3nrivD
         3YUvhMD1eL/jMYOibMgJegp/gpTtNpeYc+9Gsd0cAIVlkuvmm0xcURtYOC3fAeGytQQF
         522pYdqPkGAuGNQ2lY06/3VvW8WnKexCQ8Tb30OiouUpDl5eOa36yOK+ebhWdIpNLziG
         hf+A==
X-Forwarded-Encrypted: i=1; AJvYcCU6hBXC17tyaUcOMG1do56NBDYihuKhIPN8hj2Mt+B1cP/3nBGIgwmxVlqcHFmpsOq6PCdojyMZNjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxuta4g6gn4nCMxO7qpqBAZ5yerjIFaST3eu6lxmjYnTZQqNI
	FH1IgG08qOFzTY6mppBkQH81a17pd6l/wKCngu8E26XXDKxjCuhf9E20
X-Gm-Gg: AeBDieus8NKmTK5n78rQHpnPIwmoyk56EO31WJRsKocLbd32YJiYSxtwe8YQhHwo1A3
	23ZNO+Lu1UmvxtFLUtdZf5gH1gdoks7S5Cx430mboSw7vmCdS4s7QuoHvt6vSsN7yVKZEQQ8GZQ
	+DuvrIzBuFWgJZeIDEsI6VRYmLBMcKwOsP/AAzzcwDyUgad5ot9+7BJ0c9/OshVrejfHZG9awAW
	OigghSTFGM1SKAw8ShN/HiStIqZsf7qRZDlUBx+eouHpJJbtlvbMFAMraZwf8mWlgrqq713s948
	9j7zNyFkPVHbOKZQa6i6+YqbPv0vjcm5rqzixug+nMmEGBF9su2UNq8biFJNIyKP3U2mL7DbQzZ
	V8OoDvTEJGj2MSpjU57I1xBG2dTs0Qz881EXACEDtiNadxYS1REn6U76JsW04NxPbZiXyTBEFUN
	+ZuVc90rpJvWp2z41/LsepCBGhkUySHfzN
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id ffacd0b85a97d-43d292d34e1mr32435461f8f.29.1775721772525;
        Thu, 09 Apr 2026 01:02:52 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm63496077f8f.31.2026.04.09.01.02.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Apr 2026 01:02:52 -0700 (PDT)
Date: Thu, 9 Apr 2026 10:02:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: JP Hein <jp@jphein.com>, Alan Stern <stern@rowland.harvard.edu>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
Message-ID: <20260409100247.7cfb62d1.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260331003806.212565-3-jp@jphein.com>
	<CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36090-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D26A93C76B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 08:45:17 +0200, Ricardo Ribalda wrote:
> Hi JP
> 
> On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
> >
> > Some USB webcams have firmware that crashes when it receives rapid
> > consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
> > (1532:0e05) is one such device -- after several hundred rapid
> > control changes over a few seconds, the device stops responding
> > entirely, triggering an xHCI stop-endpoint command timeout that
> > causes the host controller to be declared dead, disconnecting every
> > USB device on the bus.  
> 
> A usb device shall not be able crash the whole USB host. I believe
> that you already captured some logs and the USB guys are looking into
> it. I'd really like to hear what they have to say after reviewing
> them.

Sorry, I forgot about this bug. I will take a closer look at logs
later today.

I see that there is a case which crashes the host controller, but
without dynamic debug. It would be helpful if this can be reproduced
with debug enabled.

In the future, please also make sure that there are no unrelated
devices spamming dmesg, like "slot 17 ep 2" in those "stall" logs.
Please find this device and disconnect it or unbind its driver.

The initial cause of all that may really be the device getting
locked up for no good reason, but not 100% sure yet.

Regards,
Michal

