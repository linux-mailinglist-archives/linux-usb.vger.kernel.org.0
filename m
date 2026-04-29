Return-Path: <linux-usb+bounces-36716-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CHNAoVk8mm9qgEAu9opvQ
	(envelope-from <linux-usb+bounces-36716-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 22:05:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F6499FB4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 22:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0006C302FB5A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 20:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3423806C9;
	Wed, 29 Apr 2026 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWfFO21Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001F828850C
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777493109; cv=none; b=eVA5NOqD9Y3wt69KmZlVwqbwEM01YRlnsfbfuisa/XlmNjhfvILXr9DwwxVD6N1+f4Po1Io8F9l6bGXAOENGsYuGVMAHOsGVd/A5LNu6n1pP69ArRey+ui4ffJK9Rr7bm5NhNanxeesagr3XL6iWew7fD5GLHXkdt2Rn5N3/CHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777493109; c=relaxed/simple;
	bh=ePAVKKP9NcWsrogZLEEbIVVVRuhDzFnU/GbQr4sBfjw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rj1c4ubVJhMSE9RBAG6cJIWjdNsP4860KpCXj4eyvuy+eDaMi7gWjN412EYw8lTWMgtMYzqDzpIjEVwQvql/ZWkA3uvvTaAYmX5XGTWATFVefTHnPB33f6g8VODlk0g/elx6BCFYt2l8nvJGftzD98kvHIYZQK5obdHiWcR/57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWfFO21Q; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3878de20527so1040391fa.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777493106; x=1778097906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cI0pCRhpEXFxJjbd7g1dsL6hzDuY/Kz/JfXvRyAIZJ4=;
        b=rWfFO21Qzl4IpB5ABsziRprf28/Ra5RbmOh/PlLL6RHAc0+cXCq/02uS9pg+/kRTAB
         uPxP72fiLz4GUVD9lpIGfkoH5YpIuxwg7bn7VR8+8vDWku0/PzRYvJpIbGZBLlFpL6Y4
         TGX/wKq356Oc8jtVbXO8DBxiqDvugM5jMCWtI6pDcYU2AQjHaXaDd0AVgzoLMI3UrfDQ
         vVUkXesSUCdiREY6scB22uNOud6jOFwn+A14q/k0EBlHWe8Xj9qjJQhPXAqHQ2wtfODo
         vvvFVkP3EXIEmKCMhkIHbY+DoAJ0Szq1wZML6eR650qD+IFG/AtDzd7fQE00g6+q6aPy
         EjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777493106; x=1778097906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cI0pCRhpEXFxJjbd7g1dsL6hzDuY/Kz/JfXvRyAIZJ4=;
        b=N589ScWK00aA0vnqsLcEyK2qaTz8xF+X9o4RBYDR9D6IpTyflYtKSxGATj9ITwQQxq
         VacblptHPHpx6+S6hI+BvwnpNOkJIfxvT0FX+UoU6k4LowUgXsExVXvRNv21ywDvuU/e
         DLW4iLbck+5DpIi9e4sBHjKy92G62Q7n3F3v9Ybymf5cB2vStyPbEX6RuyMcBOax4LP9
         qpx+HE5GQM3mnP+VK61JVDCdgsW0lowpucu0yV4x3zRRsXKreJ1XJ9RPKU0cWV8MPkBu
         uQr7nkFNj1PY7kcI+TEgCNz9jsCDqoJfOyC7Igj3P1dNFzT1o4Rpt314P6PDxlBhjiHA
         n0Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/glyRlufTcMry5s13zTK7gLN5qFYryVU9qt18sl/CsyWhB1e4b0Bd5Jg9sMLTW9uzf1FHceZ1o4aU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eazi5dzuHd4n1l5iQiCRBebMqMxXcpcGfYMM3VBKmMVinMES
	1C+tA5uZaZnA4fi8whsaJNfd/9gH7E2damPd9FBaOa2+/s63Pdi09B93/Z7c8g==
X-Gm-Gg: AeBDiesv7kPXqahg3z/PE2ljJr+lppllGVBx0t3zdIIh+BSFuSBX62iRSdd+XIHKSr1
	LiAflLis54a0Ur4dKa7eV14DzrszQaIgnxQ+hxUkZ0Pun43kFBGC0N3WlkFw7/v8zk9SmUln8bs
	uTQhK40PCDvFqmAS47Mle7Cx/LnVotK64O9LTU67XWLRgZTABCHGH2u2CRfNQcPGIFaLgzlRZQQ
	izyNMC1oXEpiIU5SGjL/HnuLS2EXIFs6eA0CaB2ZLMGGkyMnmt5Fd95P3Ni/GV85fK1st/C06pz
	L8boscKRK+eZRbqZNkt1nj4YP8wTbSvPmHQ1mO2Xz+v64qV7ilo9kMIcZkZIqMlk8DPqCmQ0BeS
	362c73bnnFm+RMvh73oFHVqCMyfcRCS3BUbKQuH9v0qJK1Y0kRmSm+TEvGcBYY2ovHnvo5qHB1r
	z3zE3/mtLd+Ve1Y4pUuMtXDYYVk6yzlP5O/moBOFOv66M=
X-Received: by 2002:a05:651c:2114:b0:38e:186e:350e with SMTP id 38308e7fff4ca-3934dec7039mr443581fa.7.1777493105766;
        Wed, 29 Apr 2026 13:05:05 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924fac8831sm8051901fa.39.2026.04.29.13.05.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Apr 2026 13:05:03 -0700 (PDT)
Date: Wed, 29 Apr 2026 22:04:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; accommodate 1023-byte full-speed
 =?UTF-8?B?aXNvY2hyb25vdXPigJNpbg==?= endpoints
Message-ID: <20260429220459.0c304ea6.michal.pecio@gmail.com>
In-Reply-To: <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
	<32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
	<20260429113604.2204b646.michal.pecio@gmail.com>
	<a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
	<20260429212408.299826a4.michal.pecio@gmail.com>
	<49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E64F6499FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-36716-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]

On Wed, 29 Apr 2026 15:32:07 -0400, Alan Stern wrote:
> On Wed, Apr 29, 2026 at 09:24:08PM +0200, Michal Pecio wrote:
> > Yes, but per spec transfers are budgeted based on wMaxPacketSize and
> > actual SSPLITs may be shorter, while subsequent transfers may still
> > remain budgeted into a future uframe.  
> 
> The actual SSPLIT will be shorter only if it is a short transfer
> (that is, shorter than the maxpacket size).  Hence there won't be a
> subsequent transactions in a future uframe, even if some are budgeted
> there.

Not for this endpoint, but another one may be budgeted next. Say, two
isoc endpoints with 188 byte budget each. In Y0 EP1 moves one byte and
leaves some time unused, near the end of Y0 EP2 SSPLIT arrives for Y1.

Seems legal, so I don't think TT can assume that it has seen the end of
periodic transfers when its queue runs empty. IDK what it does then.

> > Then I think it doesn't support 1023 byte packets at all.
> > 1023/188=5.4 and if worst case bit stuffing factor is 7/6 then up
> > to 6.3 uframes of transfer time. Completion in Y5 or Y6 and CSPLIT
> > required in Y7.  
> 
> For iso-IN, that's right.
> 
> > IOW, you play Russian Roulette with bit stuffing if you enable
> > this.  
> 
> The driver is not perfect.  No doubt about it.

This raises question how much sense there is in patches enabling such
endpoints. Maybe worth it for OUT, if they currently don't work. Or for
fans of RR, if there are no other side effects :)

> > > Adding support would complicate the driver considerably and yield
> > > relatively little benefit now that xHCI is so widespread.  
> > 
> > Fun fact: not all xHCI supports it either.  
> 
> Heh.  I'm a little surprised the xHCI implementors were able to do
> all this scheduling in hardware in the first place; it's not an easy 
> problem.

It's firmware on some 8051 or similar monstrosity. Often upgradeable.
Often upgrades exist, presumably for valid reasons.

Regards,
Michal

