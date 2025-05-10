Return-Path: <linux-usb+bounces-23838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4E2AB24EA
	for <lists+linux-usb@lfdr.de>; Sat, 10 May 2025 20:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A4A1B679E8
	for <lists+linux-usb@lfdr.de>; Sat, 10 May 2025 18:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD20C1F1317;
	Sat, 10 May 2025 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b="Z3BnEpO1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.fastemail60.com (mail.fastemail60.com [102.222.20.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B21C5D62
	for <linux-usb@vger.kernel.org>; Sat, 10 May 2025 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=102.222.20.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901081; cv=none; b=b41TYDm490ld4fEPaJibNhyGKhc2F8JOr3mbIlgLRWPCC87sB30tZqCHIj5TNgADD3jWaFmcGvgGMKoyQrz9yIIooun79AesNSKTBrbAIQcIQ7skM+eQUkwqB9rPnWGO75XkAT65JSap3Zqz0y/eXKfZ0S7aYBWbqSuit8Z9s9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901081; c=relaxed/simple;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QApGAR2si4JeQ7tVtke/ImKNb98BtiVzP8Mvc5VAK0zS3g/sVjL4UsCvTbs4FjLBsk+yLRafmgItC4F3jSSfGK43MfCl2cBblYwq4eW6f4e0rPvjiAsPaENoJhBIv6TLcv7PQwyO6/tZGW57uyvwJ4q3OdQk5tl7AlfQc7CyxpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com; spf=none smtp.mailfrom=fastemail60.com; dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b=Z3BnEpO1; arc=none smtp.client-ip=102.222.20.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fastemail60.com
Received: from fastemail60.com (unknown [194.156.79.202])
	by mail.fastemail60.com (Postfix) with ESMTPA id 6648A8A937A
	for <linux-usb@vger.kernel.org>; Sat, 10 May 2025 16:29:52 +0200 (SAST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.fastemail60.com 6648A8A937A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastemail60.com;
	s=202501; t=1746887394;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=Reply-To:From:To:Subject:Date:From;
	b=Z3BnEpO1GKcuZWGktPof8KrnHgmFqAgVxjefIzVdKSLJrHHgGCotKBnCBtnHpPhpp
	 /f/GDRWEzjMhpp8I0wLwqh1XFgNRCSUhpIOYS20LA22n9eHmzDrxzCx5/dolB1paNv
	 cP5IGHRHhEU+ewT/KMnhvXOK21eRmRckm9r6KwBJTswNo7gtFAI6r2yQ1WkNoteyvV
	 YFcfUjH4ryiXp2cPTdfpqFigAf2bCVNXEZTRRTqOAFaTaxH5LthAu1WM/ZDbpp3CHj
	 Q1elCQiMW0aT1Pt9pxVEWH6n3x1Iz4rJm+ZfEyw7YCPlcXF+GyctauCBr8Uo8k8pd6
	 auMf0AVAxNHmw==
Reply-To: import@herragontradegroup.cz
From: Philip Burchett<info@fastemail60.com>
To: linux-usb@vger.kernel.org
Subject: Inquiry
Date: 10 May 2025 10:29:51 -0400
Message-ID: <20250510102951.6BB347768EADD103@fastemail60.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.fastemail60.com [0.0.0.0]); Sat, 10 May 2025 16:29:54 +0200 (SAST)

Greetings, Supplier.

Please give us your most recent catalog; we would want to order=20
from you.

I look forward to your feedback.


Philip Burchett

