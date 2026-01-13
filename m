Return-Path: <linux-usb+bounces-32280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CDD19B92
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C88D130089A8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B78D2D8DB0;
	Tue, 13 Jan 2026 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmQuJ3Vl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F12D73B1;
	Tue, 13 Jan 2026 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316704; cv=none; b=E17MnfagPZmwtYPUr/AxKdl9DAwVhUnapKD0qVgTfcDlQJ5vS/RiXHwgxauJQ090nKSpgXrNdLLF6QFsl14sIYUn7eBnsUDazQRGMJC0SjX6ReWjUOCy3zEhEJCNN/MOEO4p8uc4TNxxZfs0TFu7NMm9ncZHSur5Jo6y0fCvkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316704; c=relaxed/simple;
	bh=L/OG+rJQNDo22V3cJZEIJYiPUAWGK9C0kRDuAD79rz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LG34VfQnx0/eJhECL9nE3bgQHuGwCB10H7y1zobNomXq/Ykl03RpsLjAMi3IXIGk3j1Xq1+UBPvbluJAtDBj6N9uKQulrZIKa7g7HV2an0ynoY6AKM0cvOtvgH2+y7XY0YnODLAgy2PgB6b453S4j8Db4rrDihpL2WGgHSB8R9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmQuJ3Vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A31DC116C6;
	Tue, 13 Jan 2026 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316704;
	bh=L/OG+rJQNDo22V3cJZEIJYiPUAWGK9C0kRDuAD79rz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmQuJ3VlG8fecaDG31EVIQIDwAznKaf30jphVjzuRgJNzcvcJGIshYC9Ux9SI23ZF
	 x/BeuKvKXM6hfp2jjcuhlmVDHdbiZgIwkOP9uk80HinjklltsVXR9Gx/ecad+4xDUO
	 rnbjXtGtK3g0Ug3KZkAYmvtLKu9+uVxqAl4SIf4Jug+a7CyCrOyo827aXJupHbU/MA
	 YlxhXJRO2gbcjTldcmpNqUY57HY7HUZJJ+HJiCutSBEXZjqwsPxn8TctDqp8rHOw6Y
	 M2VO/WsY2GZDR9WJDYZ+bfK/ooA1t/1hF5hhPAeV1siFA3butGFnTbP1XB5ENgZbKp
	 /tQazXji2J3xA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vffx4-000000002aY-19U3;
	Tue, 13 Jan 2026 16:04:58 +0100
Date: Tue, 13 Jan 2026 16:04:58 +0100
From: Johan Hovold <johan@kernel.org>
To: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
Cc: hpeter+linux_kernel@gmail.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	tom_tsai@fintek.com.tw, yu_chen@fintek.com.tw
Subject: Re: [PATCH V3 1/1] USB: serial: f81232: fix incomplete serial port
 generation
Message-ID: <aWZfGgQx6HXglmXX@hovoldconsulting.com>
References: <20251212070831.16334-1-peter_hong@fintek.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212070831.16334-1-peter_hong@fintek.com.tw>

On Fri, Dec 12, 2025 at 03:08:31PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> The Fintek F81532A/534A/535/536 family relies on the
> F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
> both determine serial port status and control port creation. If the
> driver experiences fast load/unload cycles, the device state may becomes
> unstable, resulting in the incomplete generation of serial ports.
> 
> Performing a dummy read operation on the register prior to the initial
> write command resolves the issue. This clears the device's stale internal
> state. Subsequent write operations will correctly generate all serial
> ports.
> 
> This patch also removes the retry loop in f81534a_ctrl_set_register()
> because the stale state has been fixed.
> 
> Tested on: HygonDM1SLT(Hygon C86 3250 8-core Processor)
> 
> Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
> ---

Next time, please remember to include a short changelog here under the
cut off line (---).

Now applied, thanks.

Johan

