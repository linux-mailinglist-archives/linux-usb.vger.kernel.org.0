Return-Path: <linux-usb+bounces-30987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D755CC8D45D
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 09:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CF9934A3D0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 08:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEDA315D5A;
	Thu, 27 Nov 2025 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="TT0nVQfq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5489C3C1F
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764230773; cv=none; b=s3YjYvjAbd/WDF7YA4P06ZzEfR63K1jpzO3sWt8xggJzpi6IzPzF5jyx/IzBcLLE2bnx8U4VMEAuTfuM/yk+p/fXCefB/N/xOaqDnSxOgt+RbbGfdH+X4AKddqBKfpP+U3lyJ6/Smuu0IjacEba6o8HOGHV3FuNcXY+v4Z7eCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764230773; c=relaxed/simple;
	bh=NrQ+hJsusNBo2Zjqn+nQlMnZGqlrRpOA94UA0Dw873g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hyRmLiRzLn3o2nJVFa5252y6JRE2F5xBBDSSvy4txd1Nym0HufHcnRhYoMZklkhORqwGFNxJ1u8YtRXlTnNW6i+psuYgM5/VRfU/x2pzFMkf/LtyV4lCZ9lx9IXLXLqWITOYEwZLIhcBNS/NvKrLgMvAcA1N8FF8BeEZ34/Cc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=TT0nVQfq; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1764230768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/aaleHV7thxaCatYLwwJ8YBvzzw52bC70bpWio06PkQ=;
	b=TT0nVQfq21BEulhRAcZk87ea3GX2rzK3RqaTCi5cTIUaFXGrXw6SQ/UrPQel2+B9zLGPwR
	p95DY1Oi9J4nIT2YdsLV9Vv32P0qW+TqnLoL6rL5IwbH/LCvtPd38c56zO9+QZ8sD+Agtc
	G+ifidASFuVu+w5xzqyvcbcLBwt56EA=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 79c5ece5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-usb@vger.kernel.org>;
	Thu, 27 Nov 2025 08:06:08 +0000 (UTC)
Message-ID: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
Date: Thu, 27 Nov 2025 09:06:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it
To: linux-usb@vger.kernel.org
From: Angelo Dureghello <angelo@kernel-space.org>
Subject: testusb: epipe errors on test 9 and 10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

looking for some help on testusb tool tests 9,10 always failing with
-EPIPE, kind of ep stall. Peripheral side has g_zero loaded.

Devices under test are custom boards, have same qualcomm 8 cores cpu, and
kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
Anyway, connection under tests is 2.0 microusb connector on both side.

/dev/bus/usb/001/007 test 9 --> 5 (I/O error)
/dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)

usbmon shows for both cases some EPIPE:

ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
/dev/bus/usb/001/007 test 9 --> 5 (I/O error)

ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 
2505a0a4 04050102 0302
ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
ffffff85bb5b4500 3778249493 C Ci:1:007:0 -104 0
ffffff85bb5b3500 3778249519 C Ci:1:007:0 -104 0
ffffff85bb5b3900 3778249544 C Ci:1:007:0 -104 0
ffffff85bb5b6500 3778249569 C Co:1:007:0 -104 0
ffffff85bb5b6900 3778249602 C Ci:1:007:0 -104 0
ffffff85c5b6e100 3778249631 C Ci:1:007:0 -104 0
ffffff85c5b6ed00 3778249653 C Ci:1:007:0 -104 0
ffffff85c5b6dd00 3778249674 C Ci:1:007:0 -104 0
ffffff85c5b6d500 3778249697 C Ci:1:007:0 -104 0
ffffff85c5b6b500 3778249727 C Ci:1:007:0 -104 0
ffffff85c5b6fd00 3778249755 C Ci:1:007:0 -104 0
ffffff85c5b6a900 3778249775 C Ci:1:007:0 -104 0
ffffff85c5b6ad00 3778249795 C Ci:1:007:0 -104 0
ffffff85c5b6b100 3778249815 C Ci:1:007:0 -104 0
ffffff85c5b6c500 3778249844 C Ci:1:007:0 -104 0
ffffff85c5b6d900 3778249869 C Ci:1:007:0 -104 0
/dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)

Any help on how to debug this issue is really appreciated.

Thanks a lot.

angelo

