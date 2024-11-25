Return-Path: <linux-usb+bounces-17831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DB9D79E5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 02:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA12B219C0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 01:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35308F6E;
	Mon, 25 Nov 2024 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fm9HMtFV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB88827
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732499897; cv=none; b=CX8KRRW6PwtpvTYeL/qwljlGaHVE8zoFOTJtX1d0Yo90Aos6OEJx522Qze1xQnwCAcQynMG1obPwMJY6k9Ku8W5jneWCfbO4rLTBDHyQ+JGKs2sSOhaETXc6n1PO63yhd3cZWu0TNiIDQLkXXHOjQ/7fXZ/MMXfHwSPrl1Ye6Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732499897; c=relaxed/simple;
	bh=O8VlKXxge+X9lrDtDnt4HUrPrNNZRWZMBFi23dyTgPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBxdFzS63VkAp1/vfXfDaXGwuLScOJIZ128dM2XaLK1BDzT+frBTAulct7p49NtQUxFBFlilrpvcflNFaXddtYb9VM3JrtMoP9NxeGtNO8ufORbBFYng1Ba+VocgFMsNm/0F0WB5Y+tSka/9wulvjqiqbfSMrn6dbWWWBzIpKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fm9HMtFV; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e38938a55e7so3538183276.2
        for <linux-usb@vger.kernel.org>; Sun, 24 Nov 2024 17:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732499893; x=1733104693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phwObCHLAcd/Gn1itcoCENAtkLgxCWrXSiqYspdIk2I=;
        b=Fm9HMtFVcbHb51CMfRqOpOq49T7spUzJ63Jj717NPIU1ucKxioZtbPZByORyqeJIb2
         y9cerLNB7AfZ2XeWlpwWlO5HgIpR6plG7XJQ+kRACmWjrOvoicCCttlbNg4wpho6+b++
         ZAzII1MQ5D76WoI2DYBfLfFTPQ/98qQPrtX/qHkg+DFuYIIdD7n7PcrcLx96wQlpnuSO
         BVwm+KWm/GxtGT74YZovNO3rpoIZ+YfqgfnKRd2bi8UJje3mG1ysyJvLQAC2X2VjCzn/
         oNjNykmnOGSqbxvGwWNOgWE2KmAJJw8nyBnViq1PqwjKgJiflCvbJWIouBTIg3fs2AnG
         HOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732499893; x=1733104693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phwObCHLAcd/Gn1itcoCENAtkLgxCWrXSiqYspdIk2I=;
        b=F4kjSn4o/bhMACpct6NGsk+10igi+HSMZNuq1MZsWyoqlyafeIbJftXzEC1qvRTExz
         8401MIYGlqiSqW/uk/4KykbM7lSJuf8r9i5mkyhaR7qFmH5My2wuaRANVYbXlmQ9+77P
         sbJCBi+tp9GsVgkcP4CpKY/eKys9/NKkwo0b/xGZMS2Y5f8dgY8PyQivS5ZnR6GydhW2
         nMpD/Ngy39cq/Hg3PrRBy/Wo0j7VTDWcuexl/r+p2rYupZ0jhtuHRAsitn1bP1PSm4Ph
         Kv2wJSSZojUfKIcasdFtpzJm5FnpLpDtzPzYSaoDtp9Wqgohlkvu6OhAUuuf4/D5ZcQC
         OpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHNH0/mf8Kn0GqcS1V7b/buJpnkCVfq/fxOf3pMttA5AQdJ1Qrg6x3Eg9wl2rK55tiPqbbcQ6spJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrmuNwOui849pNNEPr/aYOL79c0BsSwE8reqtEpeOd/N6GBMv
	KzON0U7p4Pk+j4DQwAtceFsAaJJGZolhEYo/y08KUjTLyh2rFZBGuzlFXiDJMoIGkv/3tDugAqC
	+EKPbnn5gY/isGAzhDysujJRAi7o=
X-Gm-Gg: ASbGncvNUtYGnv/BWLyYZipWPtRlNLk489/grDYFm44t4mp5txcMW765aXsY+jJws+I
	EHMhArNPReXgkdIYjpt67BiejXE6lEApH
X-Google-Smtp-Source: AGHT+IFAcozl5B3HVYhrCH2i5JfpehKNdgoH5SbpVHmiy+WDjk+gxrCU4q08PxcsJHrbnahqAJOlkvdxmtaAlzEKsRs=
X-Received: by 2002:a05:6902:701:b0:e38:901b:602d with SMTP id
 3f1490d57ef6-e38f8af7c41mr9052202276.9.1732499893007; Sun, 24 Nov 2024
 17:58:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122022146.ykwhz4byhy645njg@synopsys.com> <20241122085755.29cebea1@foxbook>
 <20241123000209.5qowmsx3dxianl64@synopsys.com> <e390b1b7-b79a-46c6-aadf-bf443b87f0f3@rowland.harvard.edu>
In-Reply-To: <e390b1b7-b79a-46c6-aadf-bf443b87f0f3@rowland.harvard.edu>
From: Homura Akemi <a1134123566@gmail.com>
Date: Mon, 25 Nov 2024 09:58:02 +0800
Message-ID: <CAC7i41M8=3D3PvTwrVBsjRSzzCFufoaPLYEA4Hp3tXKCadtLKA@mail.gmail.com>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Nov 2024 18:49:08 -0800 (PST), Alan Stern Wrote:

> Homura Akemi: You can try using usbmon to record the transfers between
> the host and the f_tcm target.  Seeing that data might help explain
> what's going on.

Good idea, I tried to use a small lecroy analyzer the other day, but
the reproduction
takes a long time for fio to run thus the buffer runs out soon and
never reaches the
scene. I will try usbmon now.

Thanks,
H. Akemi

