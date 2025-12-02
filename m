Return-Path: <linux-usb+bounces-31093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA0C9A62B
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 08:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 348884E2FCF
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 07:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14928229B12;
	Tue,  2 Dec 2025 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q7riMWDM"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B4301485
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 07:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764658814; cv=none; b=dgN9An4EriLrBgO11ER7sYgWO0yfVFco+3n3l73q9ISfH9NIXPS1ciYHpVjhEFco4wmmIiDQAr6umhLW7+elzAFMQ/Q9tEHZLibajxyADVH9pnnMfR4hW+p+xArtlDdkANTTfMA8ZDHjXJu/NVDD31nB3pG8fCkLYzS1bb2xV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764658814; c=relaxed/simple;
	bh=VxT9687sIRq6zf34AXOidoYTedbimExHOINVqWqDYc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7ZKAojO6G1YH+6XmKm4l6YVufI7ADQCctxdnfzWv7caevStnlck9A8QLHCMST8Z9WhEDs6UPYXPnw2rNBsHUpRzh9YiySrdTWRg1mLmB+AsN8ymDDa7MQh0FqHOOAZLqwy7Vey1BqNpbCHRxmjiT7Ot5OPA676lOfzzk/wjMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q7riMWDM; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764658797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ms0dWFKy/urlGVQJwJoBaC85nuPCfbgjO9BbmQ+55D8=;
	b=q7riMWDMCUA4tlKR8pFJE98FOonz//lt3xCkKTD3nymDlC0jdMY0aWAEiRqSYXbOvM+piz
	BOsgY4cP5Hl/lfRp0h7jvOEqsbCtzarKtkmj1KyqpAob74QP6lpoCKsTIwJSzw32NlyeGo
	9An333s6GYLs+dU5USufNjccpAJTcq4=
From: Yi Cong <cong.yi@linux.dev>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	yicong@kylinos.cn
Subject: Re: [PATCH] usb: linux/usb.h: Correct the description of the usb_device_driver member
Date: Tue,  2 Dec 2025 14:59:17 +0800
Message-Id: <20251202065917.309025-1-cong.yi@linux.dev>
In-Reply-To: <89c7cb17-c5bd-47e6-96b8-1108966b545d@rowland.harvard.edu>
References: <89c7cb17-c5bd-47e6-96b8-1108966b545d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, 1 Dec 2025 10:14:04 -0500, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Dec 01, 2025 at 04:53:09PM +0800, Yi Cong wrote:
> > From: Yi Cong <yicong@kylinos.cn>
> >
> > In the current kernel USB device driver code, only the name field is
> > required to be provided; all other fields are optional.
> > Use the command grep -rnw "struct usb_device_driver" to inspect
> > how specific drivers are declared.
>
> That last sentence should not be part of the patch description; it
> doesn't explain the patch's purpose or what the patch does.  (It's not
> even correct, because the grep output doesn't show how the specific
> drivers are declared.  It mainly shows the filenames and line numbers
> where the declarations start.)
>

Thank you for the reply!
Do I need to update the commit message and send a new version of the patch?

Regards,
    Yi Cong

