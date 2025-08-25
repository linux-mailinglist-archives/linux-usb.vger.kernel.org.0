Return-Path: <linux-usb+bounces-27254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A7B342CB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840E23ABA11
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D321928D8D0;
	Mon, 25 Aug 2025 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wNuif4lB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E581FC0EA
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756130672; cv=none; b=nItlpPx5ufRS9Grm83TnT6iSuhLMYeqQhz7imvLvvOS4xqRrrs1k3Dk3IF/OdxKVQeQKGj5gBjmr+etKwJqm9wPb34OnSXnuweInb1MP51oJu5UGCHv0vxZXvtVRqGsq6n3P+ZPxaVsbFV+2b5wcyf17V2TvmXAk8SnGkh+a/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756130672; c=relaxed/simple;
	bh=/3DslClF26Tpetvdj2Tx6UdWgmJwjn0hLHzLQQ9qlqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2dC7CjkwJNL3URPiI9Aeo1aYBo0EZI2R6unCt7BZwUjxHApqxvdIZZCXQUDLR7XlZuLMk7xSRJdH9/+cv9rSGkVCqVCoKt8sgZgaad3VNZCUYDtpel5GxquqOgvE2ZgWGIGPi3G4RDaugxsMG3moS23CULPEyyizjB+cjfTXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wNuif4lB; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-744fa68531dso1175429a34.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756130670; x=1756735470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EHuRO+zWG4akDLUijfoOjIulcloDYperZFzqc1OzSA=;
        b=wNuif4lB6/kpUoVgXqM5YDN2caRlNIy/CHV9fyKN2whyeF1G5RhOHq5WlcnWiqueVg
         rSOhNT9khA5Ctu7mMxuMfJX14LAcSsnWhgAcBgCwj8dZ4LwQcfcPexGKClEyOxPzM0tC
         fPKMIbO7NEupj8QUTbdqwZux78LYX/kXDbMIbi6hzfu7QpBfQ5G/d3objMJMgDh/spLa
         IKKuRAdZpuozdeSxH/ls4hSzuMbwZtvFZkgMA5kjDMnRXjYYsL09KBOlycJCI7hPeQgD
         6KQO052z+QZa89ZiCMXRB3Hh9Q7OrcQkiDaQU4b9QqrbZktZc8OwARJfoj+RkSljV460
         sCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756130670; x=1756735470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EHuRO+zWG4akDLUijfoOjIulcloDYperZFzqc1OzSA=;
        b=Hb4rWA7WndZ/aoCe3s7B1IeXlETDVVwz2pGgLyPkc4CQEIkmRn01Gi0bKNITVM0Xte
         brZmjDk1uM1qsLdEML+ngKsTlwFcP2D6uLJ6QSFI8ghNdguNj+jp/mtv/j26fU3SRdVZ
         0Ot33QOF8jZEY00pT9GtqPWJpgmRmc85Xb/pB3mPiM7xNb9fDCaVT8efNF7EKdW4Iln0
         nbGX4vbfJmEI+jp46+wtzsx868h/Ez7OrlPsay8DtBjVsvgoumoFZAoc+3XS2EWO00sQ
         X2grP8Dabw130psal6+hhVYoA3kYtJ3IaM4mq+m0m/IHbkV5euV7qv2Qa2lJf2LOFpER
         dVyw==
X-Forwarded-Encrypted: i=1; AJvYcCVS7093YUInOrjfnqdPNn9mm7/uu0ZUeBDgyJJViq4OMaXkBQ5vWkGEotUkmRbiP9G9AJ6Uq1I1A2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNup++UYhZVZ6zdVv+TtnEbUaxwrlgBkHngiNxVj7W7eyNoF7p
	SuEQSEvginJhftbhUIDfN4n1TwduZrq8peTxRI8MiW7HO5mpGCp0n++PpoiRe2oVjg==
X-Gm-Gg: ASbGnctSSFD18HeB2uLjwKyfF0FVxX8YmAJ5+KJZ5IstZfzzlavpi6B5p0dyWgo45dM
	e0LiG//bIGbHM3yOMese0eN8bOl/C07zLddCpyCk01dPUMIq4XWBd0odR2uKt+FpPdjGcmQc8+E
	10XkcsfaVpARyidjfhaCi6OtvXdcbiv9DZTEivT8Iyt+KfeOAEHmnjdGhQjD1RHC8P2Lvotnx7H
	M14lsqhUIGgqgWnQuANYT0MIyBWW7/yw4vuGb29pQwT8HBk3V9S2j+cbjxHTFphVhdr6NkOij2/
	TrFozfNyk1CtS8fWtIKMPjfx7HsYF7gF64vqqX/NDi3maZ70Gu+Z9rRQ23BJTPlmDv4th8+qtWp
	D1zd0LWUOgIfCzNc4wjavX78N
X-Google-Smtp-Source: AGHT+IHWk0LQpCvep194jbTPIE+rjYyZUcSUaUe83BGMBGS+W+nGqu++rpvaZOJE5FTJIa8Te798ig==
X-Received: by 2002:a05:6830:3709:b0:743:bc1:e85e with SMTP id 46e09a7af769-74500909d36mr7863102a34.4.1756130669721;
        Mon, 25 Aug 2025 07:04:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::eb06])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebecb19253sm495628685a.8.2025.08.25.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:04:29 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:04:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6Ieq5bex?= <ccc194101@163.com>
Cc: gregkh@linuxfoundation.org, jannh@google.com, rex.nie@jaguarmicro.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: Re: Re: [PATCH] usb: usbfs: Add reset_resume callback to usbfs.
Message-ID: <9b6056cf-5803-40f4-967b-e064996c10fc@rowland.harvard.edu>
References: <20250822024602.42894-1-ccc194101@163.com>
 <f159e37f-3b27-4977-9712-345e8902eb48@rowland.harvard.edu>
 <4cdaecd1.131d.198dedeefe2.Coremail.ccc194101@163.com>
 <379c80f7-aa01-4575-aa0b-d64ef01c1346@rowland.harvard.edu>
 <23f1c6c2.2011.198df066c15.Coremail.ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23f1c6c2.2011.198df066c15.Coremail.ccc194101@163.com>

On Mon, Aug 25, 2025 at 10:19:56AM +0800, 自己 wrote:
> According to the current experimental findings, when userspace encounters
> an error while using the previous file descriptor (fd), it does not proceed to unbind
> and rebind automatically. Therefore, the two uevents were added in the kernel to explicitly
> notify userspace to unbind and rebind.

Like Oliver said, this means that userspace needs to be fixed.  Not the 
kernel.

Alan Stern

