Return-Path: <linux-usb+bounces-28544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A05B962DC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 16:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60FA8447E6F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D16238C0D;
	Tue, 23 Sep 2025 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq4G4Orb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F482221269;
	Tue, 23 Sep 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637118; cv=none; b=O6n2Rmxj6q+yPftNbHrNAP/qn1KgZ4TYJpOM4ZfJxDV95h4yLlvUsn3yotHvXz6bkPzfknQdMtP5tvb00LWQ+/QdmpfWbNS8xuBCqSRJjeaaqTAb+PX3pCE11iRD1WbE0pO9U7dRMj3BCOfe4uatibS3OAtLCeN7MW+VGDMqgtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637118; c=relaxed/simple;
	bh=5bWQgyLu97OKscauuQFFOi4VSgGpoEnLtETrzB6+RtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSdQd9Ko9L6EkthFp5o08ozO+M1HeO6YTEXOY3OX5M49sCRRgBs+9XvJlykBhQ+guAXQVizO8W99tmRMC8goyBsByF9qA60cTBcjjsXvza7cc/Y1v0fs3IWT4fooqw0+QerWanRCau83JyYw6y217npDX/TcOimAW3t3WSUoSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq4G4Orb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A2FC4CEF5;
	Tue, 23 Sep 2025 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758637118;
	bh=5bWQgyLu97OKscauuQFFOi4VSgGpoEnLtETrzB6+RtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sq4G4Orb/aRYIXYI4WoBHjqGJdNHE4C88bOp9q7GE8WR3Pz6fKRsMRrnOlQTl9IyD
	 mMeGG2ljNzHm+c+07HHCHcFLxFfRbe7lQQrKWbn7WymL43ns+g/8L9xbdK8eaXMrDY
	 /52h2tOKl/HfYfpe6fPIk3BMdK+8Hrkf/5uvExp5wZc5pSpeMUZoGET8PKYwIak4SK
	 aJTyQnriCQImLQ0s4pSayBEob+OTT/ebVGnXH75NBi6vzvGI0SVPUIqdcg1f7xw632
	 QWKAiHb2GWxuVmJeg6YJ1KZ1LIiAEWvpiT1bKFS4iX/RkNR+v6GBImFV8O+liDzaHX
	 Gi2cE5oJi3pMQ==
Message-ID: <435b664d-bfec-4065-b913-4e0473537563@kernel.org>
Date: Tue, 23 Sep 2025 16:18:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: usb: add basic USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-1-7aa024de7ae8@collabora.com>
 <DD07LUJXNZN9.3RHH9NJNRFVNN@kernel.org>
 <2025092356-rounding-eligibly-c4b7@gregkh>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <2025092356-rounding-eligibly-c4b7@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/25 4:13 PM, Greg Kroah-Hartman wrote:
> Functions like usb_fill_bulk_urb() takes a pointer to a usb_device, not
> an interface.
Yes, I'm aware, please see my reply [1] regarding that.

[1] https://lore.kernel.org/all/DD08HWM0M68R.2R74OSODBIWSZ@kernel.org/

