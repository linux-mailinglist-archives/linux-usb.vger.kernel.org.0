Return-Path: <linux-usb+bounces-25726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF0B02996
	for <lists+linux-usb@lfdr.de>; Sat, 12 Jul 2025 08:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCC6C1C27210
	for <lists+linux-usb@lfdr.de>; Sat, 12 Jul 2025 06:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D116219301;
	Sat, 12 Jul 2025 06:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HfMGSo/F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0851C695
	for <linux-usb@vger.kernel.org>; Sat, 12 Jul 2025 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752302550; cv=none; b=AIrk9DnmL2DIsci0819d3klDYgv9nhXC/egE459XDsbLIdOV86lTp/7BvgvUUHfpsCQNT8ERrtXsauHOh/3U87t4yeMhbS7lGUdPsLf4SSqdV+P1Zmk2D+ZRWfkuVyYWkaY3GWjLE354XFrLMcdDJlmKFJUfAEZweO4n5sEu/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752302550; c=relaxed/simple;
	bh=DVVj+Bg7Qi/ZOQgwsg8CfO+s6RKYPBHb3oNAbx/p3LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+LiYmJDSQFtNfu0og627njyoyzaPlST7YyPFkFHqbxG55WgukgXLdb//Xj2vUOkJUy7oCTyJrOlD8mJXJwMfZpZjsUwUYMjLaKiiX9HxeYMPbCrxG1RoBAmNboN2An5tUtD+c3FdGGBJR5lA7Qppb7NxjGK1M5+cOzCLSTpktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HfMGSo/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75F2C4CEEF;
	Sat, 12 Jul 2025 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752302550;
	bh=DVVj+Bg7Qi/ZOQgwsg8CfO+s6RKYPBHb3oNAbx/p3LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfMGSo/FpKktiULDpWqtUL6sA5VFm0Tbmav3OyCAtJrY/uJ8a/JHvN3c++har7hpo
	 c8GuWoTUH8z8Y+Q8+xWGolUZr8XG5SRXsLmw9PCEmVoGpJWUTwwYYwpN5eJ/UjSBPL
	 WSm/EKwxHlixdk9Xe/zpp1caIJmIz2LH76ZSCP9s=
Date: Sat, 12 Jul 2025 08:42:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 maintainer on vacation
Message-ID: <2025071211-limes-wilt-2b50@gregkh>
References: <20250712005044.52qtqeuuypzecibt@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712005044.52qtqeuuypzecibt@synopsys.com>

On Sat, Jul 12, 2025 at 12:51:01AM +0000, Thinh Nguyen wrote:
> Hi Greg,
> 
> I'll be back after my vacation by 7/28. My response may be delayed. 

Wonderful, have a relaxing time.

