Return-Path: <linux-usb+bounces-7889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D223C879775
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 16:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732231F24DE4
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 15:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948147C0A3;
	Tue, 12 Mar 2024 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="bUun3YyO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4587C08A
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257055; cv=none; b=ApNSeVKwDXem8nIpEc0kqpurvXHTss0NCFXcYWWhGwX6v3S+sPpTkB+/WXSHHstlDLrzsGWpIGwG6Mn0Vr8rMT7HyEk0X+SAqhgW8VyH/o5YPtE39AkR5TJGXaizPJgMAYObR2RDn7ewQlsKVlM5A6A6t/87/2Vj+0/kTB+ok/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257055; c=relaxed/simple;
	bh=J/BvGeETr2e6h0OQqURDQg08Eue9xy5bUOiFTbsCL60=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=VDGDwKdvsNkWt0mrIaDfrZEoEKdKlxmH28NJt3zZ0l06bpmLz3PSteinjtx0498wNfyRzQ+d0VFi2QLfW2UvlQaAhHZcKGa9ih3+cYgxHf1VkX3eonavvRBcsQoPNowLHkIy3SS/fQgHelIjiEvRgL+gruZACepevDo2XvWXe1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=bUun3YyO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e68bab3e4cso2253487b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1710257052; x=1710861852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRdhtEjKUddYf3+o0PkvN5jXCEXj6h8YpFCSrcdu49Y=;
        b=bUun3YyOkI1oYeyxNNy1MJsbpy/fpDZdbZ+uvkBFs+dj8bSW08nHvyl4jgI1Fe5twS
         nkmuKIR2AYGfiNdgdBxZUxV2B3Bm65KAx9FU6aoUNLatFMX9e5FIHRNVTuchcNcfXWdx
         iAjVb+I1HVc9rbBQ8VWwP/HLqs5lPxP5Y1dqlpi6ADMfZrBgKh3nmGhr4z8FKUQosmsD
         jrW0ZxP9PFh4YJJf9wjakGGvNFyF4n7ItIQZE4+4J13Vdgx36UBhsLMjE3OlMiHgewGf
         3guj6bQ5xmjqSn65OwHvFOibl7wCaRU2Xtkzrtxk8GGoORaaCJmzgnVYc6DkvW3CuMXB
         vFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710257052; x=1710861852;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRdhtEjKUddYf3+o0PkvN5jXCEXj6h8YpFCSrcdu49Y=;
        b=dnJKKnS2jvBCoDbhVy5XVRRjt7B65AVUQanRey2wNvdIwYlDw2Ntevd00/J8ysLAlF
         kn+t2xUy+d3KTcJn8AixbZ4cwNHZKkmmTDwg33nk35Z5Lqrf8AMm6N7GbpXfdSAzeSAY
         pqxfsDtZ9muzM2k2SY3hDqxuqP8JmDlhrj9FMWBubeLZL37F/k0LOw+jdu8U3AX+mP1u
         Qs1XSDUa3Q4JYfuxGlS+zRg4w8TJ15FuW8f/wn9E2QKdWFOF6QTEXVWKVFx5BjXlLAoV
         Z5Nf8GafdbVENWufKDUtwMg9X7NmjYIiakbQNvp+fD0vA66n++Jd2yzPZKBZ/aKzCCjf
         zF9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtY8YwSym/XNRX/bYiLCI2VQGXKaDo1nhERmvlHDlZ+5uL361slzeEEpvmbgvMWyo7fLuaPyJgqwJJgw0dDa8Gxx/UW8NSHWlO
X-Gm-Message-State: AOJu0Yz1cTTBfys7/KUQGVitQUCXaJVliY+mS/xoGJjfGVrnHxshrtLL
	4h2G6QIhdagnF/KJXNdfjeS+T1HZABk/NjXWQISlktI92CsPJrug97CDzxNAbdM/payfOw6ifLC
	i32cy
X-Google-Smtp-Source: AGHT+IGbGLTpP6wW+bfcBrWLGJ37GvntKUBAUjz5XFDw7s2qTKNODuEYr5ND3TJIpfhKu+fTEZ5Aog==
X-Received: by 2002:a05:6a00:1411:b0:6e6:8c8b:a45b with SMTP id l17-20020a056a00141100b006e68c8ba45bmr7992974pfu.18.1710257051241;
        Tue, 12 Mar 2024 08:24:11 -0700 (PDT)
Received: from ?IPv6:2001:5a8:4289:6500:7076:c575:494e:a634? ([2001:5a8:4289:6500:7076:c575:494e:a634])
        by smtp.gmail.com with ESMTPSA id 13-20020a056a00072d00b006e66de8d470sm6240051pfm.6.2024.03.12.08.24.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 08:24:10 -0700 (PDT)
Message-ID: <1710257049.14565.6.camel@chimera>
Subject: Re: [PATCH 1/7] docs: driver-api: parport-lowlevel: clarify purpose
 of PARPORT_MODE_PCSPP
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Henrie <alexhenrie24@gmail.com>, linux-parport@lists.infradead.org,
  linux-usb@vger.kernel.org, sudipm.mukherjee@gmail.com,
 hkzlabnet@gmail.com,  reboots@g-cipher.net, mike@trausch.us
Date: Tue, 12 Mar 2024 08:24:09 -0700
In-Reply-To: <ZfAGdjPgNh2GrVXt@hovoldconsulting.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
	 <ZfAGdjPgNh2GrVXt@hovoldconsulting.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

That link is to a question that the submitter asked, and nobody
responded to it. It seems that this patch stems from an incomplete
reading of the kernel documentation. Those docs say:

> SPP (Standard Parallel Port) functions modify so-called SPP registers:
> data, status, and control. The hardware may not actually have
> registers exactly like that, but the PC does and this interface is
> modelled after common PC implementations. Other low-level drivers may
> be able to emulate most of the functionality.

So, the PARPORT_MODE_PCSPP flag denotes the availability of the SPP port
functions, not any fields in a struct.

On Tue, 2024-03-12 at 08:38 +0100, Johan Hovold wrote:
> On Mon, Mar 11, 2024 at 11:50:26PM -0600, Alex Henrie wrote:
> 
> Please write a proper commit message here explaining why this patch is
> needed. You can keep the link if it's relevant, but you still need to
> make the patch self-contained.
> 
> > Link: http://lists.infradead.org/pipermail/linux-parport/2024-February/001237.html
> > Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
> 
> Johan


