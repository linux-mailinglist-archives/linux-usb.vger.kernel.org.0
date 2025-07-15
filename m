Return-Path: <linux-usb+bounces-25834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C8B0588C
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 13:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412CB1A61D99
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AF12D8790;
	Tue, 15 Jul 2025 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JpNxzF67"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626114A4F0;
	Tue, 15 Jul 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578061; cv=none; b=qOqc0qCFviqAGvSHOG4phd21x5GIlsDk4bfUGzvZpchW31YaufXSkG5ox4+tGrClLvnTLcVRmpdZ+t3jvLPMS2S7RnsJtlToNzpquxgpEMw3JMQ8yBfwg5o8L6woNbLbXi2c+xRz1y3daS2IqbMYCKGmBCH+0NYMZV9x9UmpHn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578061; c=relaxed/simple;
	bh=vmjfeHOLNnBbfcftOfHr7lXdr8h5uTQb69Yk2d3zKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOr63ALCiVX8vMYnTTvcTz/os4bD6PFqvRXQXhMUo3tnnrV6flWO1fN1iRLn7QRE3gIsn6EBMBso5LYYQxBD1gHA7fq6HJjtF6PX1rGrlDkBtOiQmV+bV5h65V6SEmcwcOQkFH0rZXyKb7GTY2UXedMIhJr23teuhtx18Y+WGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JpNxzF67; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18247C4CEE3;
	Tue, 15 Jul 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752578059;
	bh=vmjfeHOLNnBbfcftOfHr7lXdr8h5uTQb69Yk2d3zKMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpNxzF67ZjjzvzLyz+5jIonpfBRokpz/dk3MEzUNE8p5Ycyk2lDlvGuf4GzI4bpYw
	 v/wcX1nVMcNUYtSJfGVVAxVElqNQNMw5clUFldyaz8NTgQJWdcunNnjvH8yExVFjX8
	 xfxVPZhmmDvbo6sQvviHzdeTHU1ypypsOGEjUv90=
Date: Tue, 15 Jul 2025 13:14:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 6.16-rc7
Message-ID: <2025071507-autistic-undertook-9306@gregkh>
References: <aHYKjbdJJiTLzHSu@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHYKjbdJJiTLzHSu@hovoldconsulting.com>

On Tue, Jul 15, 2025 at 10:00:13AM +0200, Johan Hovold wrote:
> The following changes since commit 08f49cdb71f3759368fded4dbc9dde35a404ec2b:
> 
>   USB: serial: option: add Foxconn T99W640 (2025-06-24 10:45:43 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.16-rc7

Pulled and pushed out, thanks.

greg k-h

