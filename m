Return-Path: <linux-usb+bounces-27516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF70B42D19
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 00:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966BE18958A8
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 22:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766C2EE5E8;
	Wed,  3 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8yqS6I4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3D732F75C
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 22:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756940223; cv=none; b=o2pr3QcXLDc2aLFduDbYRP9oi6VcPmsNZv4v0lZKIMyyjSpSJmz7Ng4eNZMqhoxYKTZRSZnKsza3bmvOBbnMtZ/9DRjSggdtly2FS5Sms4XH+TwSYAOAva4GIgXCZcUeNAqefS+BfvTw1wx4APPQKxrlSLfU54UG2DggB5UQ7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756940223; c=relaxed/simple;
	bh=cf41n1NC3cILHg4dGNYajKktGrIxlqwD9MEyOFVa4dI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TOahOSrvaQKTGwG4dVtaDsBIp+bc6F7nWgz/44qAP2lpX8LG5iOi5tpS4GChTx31D2px3jgzCy7w6owcR6aaROIHw5Glwu5DUiuiFVgOawCEr04zqnyw3EzSYFMkf3W1WZ/qy0Ct5YCmQZX+AXbxPHuJfl+gCIgeO0MZ0WmNRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8yqS6I4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3db9641b725so363106f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756940219; x=1757545019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cf41n1NC3cILHg4dGNYajKktGrIxlqwD9MEyOFVa4dI=;
        b=Z8yqS6I4MrmQxnFp3c55s6ACkEK2HsCZPOvDAfkxbR15qJR5uyFpAk5ZulCk/Eia80
         zyiOoCsA3YSCEj28Tcgt8DEmTAEwU/Hyr1z8xfePcMAg2ZiaFZanrG4wbPbTH45OO6Wf
         At3JeECcnsBe6nBcSFXWLeGKWiQ683zTZFq4np0k1MWif1rsrlT6/LPv5oZhiCsdOLz3
         eAFDAcVhjZ0r05+NkrRIHv70EuLCWfHDBH1J01MEbltJpb4N4qeQpGdkF+gebtqduV9A
         YyypRzwHgJ5uH7acYtoHeHNDr4tbpowUCh4sbn6cKs6nnEHfC9jiig2UBpHLB4Sn7LsT
         Wjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756940219; x=1757545019;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cf41n1NC3cILHg4dGNYajKktGrIxlqwD9MEyOFVa4dI=;
        b=iLlqrUZlFWkkc3sfSJMAOJuDZNPlS0p6Z/kBjWTGuu05NGmcgkEqGXsCOpdTTpgrOP
         wlpfbwFbAooFFOKDOAZPqOHncLDyHbJtUrJThRzVJ1niCAdu8aW9hGwOG+jHg3457IWW
         cvYyQVnzHQmveJ98YoWlIrLnqiWzthKozXv67Nosvu5WJLaSwIUUv4XCtzI7vRMLx08i
         Gb/iAr36ZCk+UIXhJNZp+ipL21rVKDLc7BdSCEBV9oxTHyFOWLtwOcp1pkdcGgXyOKoO
         DsXL7SB7KWRlzwVRD2wbRX8kzzuPcryW3p74ZtamjBMjaLNUbxG6gyshEXrWwEJSQAOk
         morw==
X-Gm-Message-State: AOJu0YwzVp2GE7n+iwjjp24op8VUXz1CXe1rqANi446lFlkY6AkSIt2D
	Tt/ENW7/5VfaanbQOuVDaQhipUnuz+MGRzOgqf73O9GIJMmIf1g432r9VcYhMk9+NCtQ9xTpxld
	zeHcqtdrCeJrevQ31wkTVWC2KbYOJB8hHj+Xe
X-Gm-Gg: ASbGncvxelu/jI+vFmHTUzpSxl4UrOqbz6VZkjXBsyI45xHDsGKuDuDqbJJ+7Q4SxHF
	fQdhwyamcs2px5IjixrJpCLXLeCw4hxS+jb3q8ZDdbPR7LRtYln4y4a7whhI3oiaA9YLFoygi9t
	RbZ4SrV6un/diJIjnMSiIm3t2efrZk9BDRs6B+Zf2n4jTmFcVyz+1BBocjcGkDAopvjfVxsYNQz
	zDtGTCKNw==
X-Google-Smtp-Source: AGHT+IGTdWYxPoEyeXDb0+E+XwQgp+NqaMP+HJrSfmx/MfL6B8cTpO3D9BbHJNi8HqxRfovR0UZKZ6xA++OadOsz5jA=
X-Received: by 2002:a05:6000:2289:b0:3de:9ea4:8f5 with SMTP id
 ffacd0b85a97d-3de9ea40c0bmr2395929f8f.9.1756940218465; Wed, 03 Sep 2025
 15:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 4 Sep 2025 00:56:47 +0200
X-Gm-Features: Ac12FXyimavJ-PGI31L7QHCxBfBQ09lp0T3QZ8c70WbrTF_3i2DzgyBg-bRMJSE
Message-ID: <CA+fCnZfnyjTCByBB7nsW0kb7CTABaq_-u5-qtv9UWV3Rrg_khw@mail.gmail.com>
Subject: Reasonable limits on transfer length for usb_ep_queue
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

I have a question about enforcing limits on the length of USB
transfers on the Raw Gadget side.

Currently, Raw Gadget limits the transfer length (usb_request->len) to
PAGE_SIZE for both control and non-control transfers.

This proves to be not enough, at least for control transfers: the full
configuration descriptors for some USB devices are larger, and thus
sending them as a response to a USB_REQ_GET_DESCRIPTOR/USB_DT_CONFIG
request is impossible. And I assume there might be need to support
larger non-control transfers as well.

I see that GadgetFS limits the total size of USB descriptors to 4 *
PAGE_SIZE. And there appears to be no limit on the non-control
transfer length.

Is 4 * PAGE_SIZE a reasonable limit that makes sense to replicate in
Raw Gadget for control transfers?

And for non-control transfers, does it make sense to enforce any limit
at all in Raw Gadget?

Assuming that we want to allow Raw Gadget to be as flexible as
possible but without breaking/crashing the gadget subsystem.

Thank you!

