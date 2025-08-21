Return-Path: <linux-usb+bounces-27135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F858B30783
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 22:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264F2660149
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 20:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B5A350D5C;
	Thu, 21 Aug 2025 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LP0OcRIq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3A35082E
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808728; cv=none; b=NsyzKXMzZH7Q6eFVuLSIK96yOACvJN/N8kLqFiuQNtezJQmpnJr5WKZOn4AwsHjFbSUw4q30tk6OK+0Nd+xkGIQFQ8faxfFR751q9tzs1gXKmgL8/wBBDUS2hohBD6p8d0vwYCsz+CHcKIn+nBekbvP7L0Aq0yXLwxFkPculGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808728; c=relaxed/simple;
	bh=b9Vgc3HXSpJhFRwUVRFaKmmUX35W6I7gMU3Ha8iEHxQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=T10Sq1hKXvQGlumyXOe04XwsLJvA+d3vhahpLNvi0nru5hfs0Vp4ywbociGRtulTvdspw6NQziasTxLDBW4ELJuZ9n3Hj7U9o8EJQPDjhRdNARCJMYcATl2td3JB1lnmhA2h3pSOfeMwjP4yMAe0BOAcrmsXl/bvcJr4mWFhpLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LP0OcRIq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-76e2eaecf8dso1233145b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755808726; x=1756413526; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=griOF4dIY75OeBtDFRxsEqpmP2nvJJ7eRfd2rYxk2OM=;
        b=LP0OcRIqeLb8lkgQOHOJLZT07o+Wf8OryeXdR6t6Q1+MiM9oUFD4di3N0bJFw2mB/w
         UT66pOnnIky0x7Uj8zwKPmZW1ip+BmdTLaQ9txjjgSREZa4wIOlfaYrd23EPfFqUMviA
         E7r7AqtkcdUzqiU70lID6AW3rnSe6UI8Wh7ZInJLhKWQecW+CkysJdSLRNTtlf3obYoW
         7Kc6mP2iOBFvtYerGyc6ghT0v8+iQ4MtMjjlQDlrMInDdmMGk7xemUsOkdYeOGFOAkOP
         AE9LuqkuA8RCDJ9YJtb5TaBm7WYYV58DAGd4Ht9DjthOjBjTG4G8/u9Egv74gVcN3FP7
         UH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808726; x=1756413526;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=griOF4dIY75OeBtDFRxsEqpmP2nvJJ7eRfd2rYxk2OM=;
        b=fDP6nhFJmWlt+ZZWEoW5YihK0uBozV+s/9l5DswVwnjR/tbcw1O/HhmVgrygWdzPP6
         iDwo3LwEMGQl/lHiHamrrt9IFAXc1Sn3OQouSBvGQD6FW+czvFOcfVMSf150R+92/O7P
         shZ8tyd3PxZkcBmL2eyuw7jFmhguuSqXwdCEdld7vgP3z/yZrc45LEv2HAC+h9Liwd/j
         l2uwb+wNCqGUlbqfLqn/aIKSQHMcC1Vzjrre7iLba3cJeO2ivq+fIbJJr7gr8IPR3vuC
         xA1MdRIOtlAke+JADkJLaum3s3kUqWjRsMvFa2JVQCMcpzndK3EEKLgorR8+93DkovkL
         ZC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM6dBQFUbo+rJvJqAhh58WzEoRYCbRQskGqBdSgyEEW35tkKR+lGib7ly5sRNb4kl9trAhqqxen1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCExBcbxPeSxZw2KMzRpKpW4aBeT6TeVyW73YMLASPKx+XxVPz
	238IdYaH+c/XKuYo/Bu07g4CnhqIGv7eZk5d86k3imGQS8cV3h+A/BNNd7e6eXw00SWLm2++zK5
	UUMHK8xwohlJLlo7/+A==
X-Google-Smtp-Source: AGHT+IH5wqgX7kV75VrrIGv9jCu90I42QGP9wlvxy7iq14Qh0uf3jOrlZbU65cjUt6qmmkVoXW3DSZo+bGHQ9pg=
X-Received: from pgou3.prod.google.com ([2002:a63:b543:0:b0:b42:8fa3:ac07])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f85:b0:243:755:58b6 with SMTP id adf61e73a8af0-24340d923b3mr738101637.55.1755808726370;
 Thu, 21 Aug 2025 13:38:46 -0700 (PDT)
Date: Thu, 21 Aug 2025 20:38:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=rdbabiera@google.com;
 h=from:subject; bh=b9Vgc3HXSpJhFRwUVRFaKmmUX35W6I7gMU3Ha8iEHxQ=;
 b=owGbwMvMwCVW0bfok0KS4TbG02pJDBnLm89tKC7YeX7L54XPtBljqsI79j+1dy2b3ppabmD+Z
 4/BjEyhjlIWBjEuBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACZSHsbw37tJpzFqYsrSYmP+
 Fr5f167MmHDr4oopqYGzzvQoNXfc3szwVzr4kMJRCTmJrxXTOrVcjwq5+u1Yo3/o3BHxaRM/rJz lzQsA
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821203838.1721581-4-rdbabiera@google.com>
Subject: [PATCH v1 0/2] usb: typec: altmodes/displayport: add port data role
 handling support
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset adds support for Type-C PD altmodes drivers to query the port
data role using typec_altmode_get_data_role which requires a new symbol
typec_get_data_role. The UFP is not allowed to send the Enter Mode command,
so Alt Mode drivers can use this check to prevent driver registration
during the probe sequence.

The DisplayPort Alt Mode driver queries for the port data role during the
probe sequence and exits if the port is the UFP. If a data role swap were
initiated, the driver would be unregistered anyways so it is not necessary
to keep it alive.

RD Babiera (2):
  usb: typec: class: add typec_get_data_role symbol
  usb: typec: altmodes/displayport: do not enter mode if port is the UFP

 drivers/usb/typec/altmodes/displayport.c |  4 +++-
 drivers/usb/typec/class.c                | 13 +++++++++++++
 include/linux/usb/typec.h                |  1 +
 include/linux/usb/typec_altmode.h        | 12 ++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 956606bafb5fc6e5968aadcda86fc0037e1d7548
-- 
2.51.0.261.g7ce5a0a67e-goog


