Return-Path: <linux-usb+bounces-26855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C7B2678F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64547AD6A2
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC4C309DA8;
	Thu, 14 Aug 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sjMAUGEz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B6D30102A
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178280; cv=none; b=Bt3mRUSC7k7a6djJOEVC3ZusNTq5YOSCvxp2nDyvOYGCWfPXf+vb4B/y9879TxKncM2nZEyJkFmGRJPOCrcHI4z4Gv/G1Dh5FE9RouDAeBPlcL/jAdehkxJ9GC0WJWDJOSQvAnnZq7gpwn10EGzMpMwl5u+7N1Gg2qqewRVXxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178280; c=relaxed/simple;
	bh=V0rI8X5UVAj1atbfgrr6xgGtZmdYXS7ivfPk/9bdP4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLJ9rUaY1SqkgZvqcNn+wPtEEBonU46ARutMf/k3ZCEtaSPn9UN4xbMGPEdugf5yDKBhYHmfkrI5oKFgqrE/hXfoFCtfgYNJJOo7uqHy6D2ggUi/xAXqlvkvZhBoUDEPefg54Ujmd2pCryc43TDw0Ic31EwzjQN/ihm6gc/apDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sjMAUGEz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE367C4CEED;
	Thu, 14 Aug 2025 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755178280;
	bh=V0rI8X5UVAj1atbfgrr6xgGtZmdYXS7ivfPk/9bdP4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjMAUGEz57UY7gKDOxh0S7GuHLj0jVBOfRs1wGAemF09yUUQz25juBq/iYCzJRAMK
	 4muUPDbEhDlzWAPVJSxse5Ii/UBuom0HEUH851QF0xIpFR+cRI+J3xR/MqDj4Zd48u
	 glOazKzJ5N2FgSJucOAETh3ZUYbWvWcLUUTPc+rA=
Date: Thu, 14 Aug 2025 15:31:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: raub camaioni <raubcameo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Message-ID: <2025081419-appease-destiny-300c@gregkh>
References: <20250814131609.593641-1-raubcameo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814131609.593641-1-raubcameo@gmail.com>

On Thu, Aug 14, 2025 at 09:16:09AM -0400, raub camaioni wrote:
> From: Raub <raubcameo@gmail.com>

This line, does not match:

> Signed-off-by: raub camaioni <raubcameo@gmail.com>

That line :(

