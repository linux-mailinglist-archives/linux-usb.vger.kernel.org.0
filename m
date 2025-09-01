Return-Path: <linux-usb+bounces-27408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B67B3D9BB
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 08:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D2B4179FBA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 06:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808E3243387;
	Mon,  1 Sep 2025 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoDbyy5O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379A140E34
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707531; cv=none; b=rR4UEDXb/eA7FZkvo9NFJxghQz8QLyl06/7INNLG7AcqEoq/X7oh7j3hCbpsoe2PVIdVipT07Zj/y6DaAFsqf6gSms4t4jwlpp2XrSMfKrqBLqZV50hZn7tZ115I+X1aWn7JLtTMI7Z/L0F1rsf8mLPGN5w5qTF1aH7/Pcp74Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707531; c=relaxed/simple;
	bh=V9WL3D35hntdghzWckrGHh7DkD+f161AmnPNqDLnU8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJbytlQdhWvktiWGov9qrYhatqQ0qUAFuv8j2zhtJ/E0KllcRf5i5Ww6wtKyH0ywi/rpTUORIpmYxvGxR/oFg3Ak1nL2wHJF9SnY/vwfLyaxs2tR0oepyrfcSeVf6xKpKK0wykUL9CHClZEEPI6yWoexlEQJToPwDWX5fzkFjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoDbyy5O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6e0eed29so1502341e87.3
        for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 23:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756707527; x=1757312327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFnhKinDtJHkKRbhGn9s0F7OnrDE3CmGONt0j/JV+SQ=;
        b=XoDbyy5ON+ohZ3HyXgF9i6HyBmUCJC08aMGLf/QtTItarzOjjAyst93sIWDUiBfoId
         3oQWqEUDYen0eK8h7lhVxgrJM0JmczAZ6kyBQG/8FX/+eP8MSp+NLOjfjhyY3NNh1H1D
         Ao5+liBkC+0kcasuP16tDJUQH4GtZXHld1XkFHsfLpqU6gnrYVYOCxzvLL8s8Ee4vImr
         rOQ1jI0sgpKonMqIpkl45kv3BINp+GVRxmIhIGYEvAoEZLlYFJqWmPShzgbq5ADpAvJs
         NEhLL8xekW+uicQt7exVlBc+CSRqWpQsMaaxSMh7sgu2+Qo8BnsSfwjR7sjKPW8UAN19
         Z3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707527; x=1757312327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFnhKinDtJHkKRbhGn9s0F7OnrDE3CmGONt0j/JV+SQ=;
        b=Q1Yh5vIQBmqDdbRrQnBtVgMNgFtTDmqE5gjQQKkP58BlRxSPcgxUvNp6y6KUsGqQU8
         6cT43BPZSKkzkI/0Q35J6V/fp3Q5/2X2IFYiEev/tS8AtATGQ7198p7fmYUxnxMsQmGR
         D355etdwIQNLhZbQrepGyPHbI9LD/tRNKvt0HpNmuFTrcyCnMqmwilTSpPvzbgvfunRW
         ZsUbGGmTplZeQ6aYKcNUveR3N4O87k9efmklByGdQjScHzivsxW/YwFHRBrFFckMHN2F
         2vrwXM2p+StbhMq+RIGbMMaqt22LmsTG4s1t8Lr72/S5YCIy6vWXgEnc1Wtm9IVe4cCc
         BKqQ==
X-Gm-Message-State: AOJu0Yyf2cn3ae06zPe2JCJcCCGz37lcnwX6KRMKe1o/M7Dtc1s1idi7
	VnZEYyUsNWQM1EOnqK2JbB+gj832jS6oQ71Ul3SG1+mUvBZSofEtZ7AAu3BwiQ==
X-Gm-Gg: ASbGncuqY+WkzqjjONo3eP0qtWqUcgbt4/uMST98VUhQSa6m/d9ASI3akqFnuw2NSPY
	9o8CuHAZ9l306Wyy1EoZEDhNsTmohWIk3sPVcNR8aMrhn2a0DdHOWSq8gXh+vjgEDqw5DUoN3Uv
	ZEFipRyuqKtkBRpxlyHuzR8SCEMbhyBeutwImOVCKZjsqY1Cc5GwRWKVc+EsL/gVRQg9UW8KONC
	IZXc16C+quJSJQwzhSsthlDgO4oLPl15oeZmct45cS4SO3dObOyM0xinNbhFzdHHpLvmc3iSVnt
	PmS3Acyc8LE9uLWodP+FHj+cUdBDULyEjjWIGa5muIwy8wN9LsBq+x5n+ju48p9egxpFeFFnYgi
	7H0hCggV9Vcllvjfc8sJoDH+mTXacVFj6zPVp37tOxfLPng==
X-Google-Smtp-Source: AGHT+IGtQCoyoPDqNRIKKCHD8OtpqHEF0CanGM+ir6R7MUCimRo9f7yg8WDB9YnUN94z4QoSB2nkDw==
X-Received: by 2002:a05:6512:2522:b0:55f:439a:dafc with SMTP id 2adb3069b0e04-55f70995986mr1992067e87.27.1756707527136;
        Sun, 31 Aug 2025 23:18:47 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774b172sm2742444e87.60.2025.08.31.23.18.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 Aug 2025 23:18:46 -0700 (PDT)
Date: Mon, 1 Sep 2025 08:18:41 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error
 due to Endpoint state
Message-ID: <20250901081841.6d6c2fd8.michal.pecio@gmail.com>
In-Reply-To: <20250829100649.6eaa94e9.michal.pecio@gmail.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-5-niklas.neronin@linux.intel.com>
	<20250822101514.3a730f4f.michal.pecio@gmail.com>
	<20250825091552.350d027e.michal.pecio@gmail.com>
	<7b70c5d1-b83a-4bce-8d3f-9e181a0329a6@linux.intel.com>
	<20250829100649.6eaa94e9.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Correction:

I previously missed this line buried in xhci_invalidate_cancelled_tds():

                list_del_init(&td->td_list);

Which means that a TD waiting for Set TR Dequeue cannot be processed by
handle_tx_event() if it completes normally. I don't know whether it's a
good thing or not, but that's what it is today.

Ideally, endpoints just shouldn't run with Set TR Deq pending.

