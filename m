Return-Path: <linux-usb+bounces-25590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181CAFCDB4
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 16:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2842C1622DB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C181E22FC;
	Tue,  8 Jul 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gX6aG95p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B62D2DF3F2
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751985185; cv=none; b=tk9WbTASyjLHZhLOaX/NsRC/hnDhfu/+8Lh1WPMhQXHkT93RbRTS8X11JzSur+18evsv2koRNfTE7F1dbJyp685bIXg/rDIDIGvCN45xJjZ2oM5cO7HYKFlehEU7GHjrGdncVqKInxFTJBPF26DkmJGxHbYNap0fbuzuLeGvOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751985185; c=relaxed/simple;
	bh=9gJZ9P5U2B5/nhjex3FiPp/yJQqM7d/SqS6PCkuUsv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ablg1gyTure8c/XNT8F/98bZ4wQw3w0cEOYgHVlghNo9Z/f6W25iAlqw1zO344NIjZIc1qLKZccX0ePjqez156AibIozOWAq4MRFZTek2TLWI0bagR8iaHge4zBt1AqO6s5DI7TaaEXOZmouXfsW4HLEBnveBPAhDr1yT+Mp2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gX6aG95p; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a9bff7fc6dso18387441cf.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751985182; x=1752589982; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TkJTXQkSLDM+H3JzJZs9zJqYDllZ/dGQLsPeP5e4naI=;
        b=gX6aG95pi4qvjXu2CmP4RIsuOhX/dFY3QETxxjwMMP9Bg7O/yaXryAH6iMcKAKjlf/
         OF4hjqP0DsHByrtjnMo985jjvmPQiVN6dzkSgHJc/7Oi9Zw2HRGhzETwpcy+nU9oU4PD
         CkjUslEVxUX7Aau3OCssff+aweYElGb9ntpZFPpUp5IFF/nhyccmlYmQYgTyfxY2LxqU
         GAdW6IKKZBYtSROs9mCcyzIA3uf8PjdxWx1eJgaYGlJCK7b36IhWb02surCnTMx2YDuX
         js9lKAgyPpxPuMl1QlB5zIyRTMohwuRoP6uC6WaHDCM7RIb17YP+UQcV/ISlaL3TsPf9
         Tvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985182; x=1752589982;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkJTXQkSLDM+H3JzJZs9zJqYDllZ/dGQLsPeP5e4naI=;
        b=OimGQrN3gTQ5FFpo7H3Es0VLHRc7bTbbN3Fpu+GOrSZJ1TzBTWH2kiIc0i7W7GwFw8
         LtwnZDE50CCzgP7oCaXre148HmZbBVyE9PzCQenOMyZcorEW2JrXS1ySyFNC1SEI8oK0
         /5P6IESHs8K2FpaaXLW+jVZ3GIiSVepOPaS7JMs5+yAa9KQDJ2dfdlg6kmBPHSJwcKoP
         T4Qeha+pfNxBAq8byPksqDkuC6N2Jo4yPv9d+0iKTfZx9rZ07ev2hE+xdZz+iHHLJ1nl
         MZ66thN7Cfz8LTjVO+r9g5mkOvbhHcfQNKQCp8dek/mada4BJrt/8cZKqFyh/TxlVRDz
         F2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTTd4giswr/y3PyVsS6z/yVaWPCxobOJRZoc2lkvM2YFeI1FBjwRTVn+eTJBNPz0T3hfnJ8wiCSZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmaSdmpYuTuTQrRCmrJDazdwAFUfqmTBwUH1XjAfq6OBPDoFn7
	XKNjQ3sbefsTtXdu86T5GO212NtzuHun/xmcxtUNIz263adR5SVkksXkz0b1JoQF4Q==
X-Gm-Gg: ASbGncvaJXajyjj0M+rHeU4YiPKq12kHFfE1Ybci5vwnvsa3GIANNAELGV6+s0Giu1N
	lKYnWlNXO9RYHS+5v8otXYFDiQrs6Pz2yISAcPXLgVap3H4fREr4PMQZR+ogSt/EFKFDyUcpJ0U
	enDUGffhVEKU7wKQrLHOCDZvjPKfzrFHWvW0D9qqAfv5g5zk5VvchxpidyA51dvz+igNkLvy1V7
	qRlACWcTIQAx4jtVXOXLRYt+MJhnGi85/9NJ6S77QrOja8s/fz31Q2hzmLfMuswgfohMytrRNyJ
	BuhV58oOMJ1R0RMxVO4kD/YWJtn/Nlej+meVSS4yMQ04uSq+dJj4Ky+QtXWwAGwAYNaiQ/2jkBs
	FQZwqwc0zmy7bu+8=
X-Google-Smtp-Source: AGHT+IF12A4YzQxhASZJw3qucM2mtdDIrnVfX1CGv4cPHFWrrPOlNBqHO3i9JOSTmOyqi0e0jaMeZw==
X-Received: by 2002:a05:622a:98f:b0:4a9:8232:cb35 with SMTP id d75a77b69052e-4a9ce5bb4c0mr45895881cf.15.1751985182246;
        Tue, 08 Jul 2025 07:33:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994aa9413sm80080391cf.78.2025.07.08.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:33:01 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:32:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Serious bug in HID core
Message-ID: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Jiri and Benjamin:

Investigating a recent bug report from syzbot 
(https://lore.kernel.org/linux-usb/686be237.a70a0220.29fe6c.0b0c.GAE@google.com/)
led me to a rather serious error in the HID core.  It could affect a 
lot of drivers, and I don't know enough about them or the HID subsystem 
to fix it right away.

In short, does the value returned by hid_report_len() count the byte 
reserved for the report ID number?

Some drivers seem to assume that it does and some seem to assume that it 
doesn't.  Here's what the actual code from include/linux/hid.h does:

/**
 * hid_report_len - calculate the report length
 *
 * @report: the report we want to know the length
 */
static inline u32 hid_report_len(struct hid_report *report)
{
	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
}

It's somewhere in between -- it includes the ID byte in the count if and 
only if the ID is nonzero!  And of course, this behavior isn't mentioned 
in the (ungrammatical) kerneldoc.

The particular scenario causing the bug found by syzbot was this: 
report->size was 0, report->id was 0, and the lower-level driver (usbhid 
in this case) assumed that the length argument (which was 0) did include 
the ID byte.  Since the ID was 0, the driver skipped over the first byte 
of the buffer and decremented the length, causing the length to 
underflow and leading to an invalid memory access.  In a more realistic 
setting, this would merely result in data loss and leakage.

How should this be fixed?

Related issue: When the lower-level driver's raw_request() routine is 
called, can it assume that the first byte of the output buffer always 
contains the report ID number, set by the HID core?  If not, should it 
assume that the first byte is always reserved for the ID, or that the 
first byte is reserved only when the ID is nonzero?

Do __hid_request() and __hid_hw_raw_request() behave the same way in 
this regard?

Alan Stern

