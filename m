Return-Path: <linux-usb+bounces-4872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64982794A
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 21:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC6A284E81
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 20:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E30946BBD;
	Mon,  8 Jan 2024 20:43:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 52CC156753
	for <linux-usb@vger.kernel.org>; Mon,  8 Jan 2024 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 509471 invoked by uid 1000); 8 Jan 2024 15:43:42 -0500
Date: Mon, 8 Jan 2024 15:43:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Elad Nachman <enachman@marvell.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: host: Add ac5 to EHCI Orion
Message-ID: <79a951c8-abca-44b0-a769-a67c949b6ba3@rowland.harvard.edu>
References: <20240108175457.4113480-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108175457.4113480-1-enachman@marvell.com>

On Mon, Jan 08, 2024 at 07:54:57PM +0200, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Add support for ac5 to the EHCI Orion platform driver.
> The ac5 SOC has DDR starting at offset 0x2_0000_0000,
> Hence it requires a larger than 32-bit DMA mask to operate.
> Move the dma mask to be pointed by the OF match data, and
> use that match data when initializng the DMA mask.
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

