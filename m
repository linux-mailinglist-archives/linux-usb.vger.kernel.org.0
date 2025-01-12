Return-Path: <linux-usb+bounces-19213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C3A0A7C9
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 09:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354401888AA5
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5AB188CCA;
	Sun, 12 Jan 2025 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DwD2VgGh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C9246B5;
	Sun, 12 Jan 2025 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736671369; cv=none; b=RoOohW1zvSBjKmbD9cTRZ2ZvKAILCoUpr0OxrlG7sF6YPiT7u39pMqceCWga3x8wP83KXD48W/S/7lZvPdgd7MMbr/NJHri/320ZL706PXUCzvDqiZ3zysRSYaOASEgce9qtwyceDGmW0LK9bFUcJj1C+aOSQaFs+N27dyRZE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736671369; c=relaxed/simple;
	bh=2yCHTnmj/Q2HOstVwAmjBNNj+7iK1sF8wvRPccmuxVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyEm0eKPgLHbspO+QtbayAZEiNSXhR71QrmkBXCvZoy9Yh/ZzLmZT9EV/k+PMd097KOaBK7WmdcTk13PPcPb1jsd49/JVxD23Z0ifgtcIWxXJeBi7E2qLajb84xF7ny4ffC1vkht6JiRLBx7C/Lw88Mebe+D7qBwyAS3GX4XCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DwD2VgGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0C6C4CEDF;
	Sun, 12 Jan 2025 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736671368;
	bh=2yCHTnmj/Q2HOstVwAmjBNNj+7iK1sF8wvRPccmuxVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwD2VgGhwSw3woGdjBZRE7SqTf/fsJm58ZQl1cxCkScnoB42JyrlzcB78GOLX4HI+
	 q3Fe63cBIXyHSZhRejH46GhFwHnWYMOjlou7vbcvSJdyrWxEhGQ+OaY5Mdawa+9y5V
	 l5Bt+yO3QmVR9CqhmGUxqoNCtsvKB7tqROz0bZpE=
Date: Sun, 12 Jan 2025 09:42:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: qasdev <qasdev00@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <2025011206-starboard-dexterity-a740@gregkh>
References: <Z4LP0VsyOkaRBQL9@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4LP0VsyOkaRBQL9@qasdev.system>

On Sat, Jan 11, 2025 at 08:08:49PM +0000, qasdev wrote:
> This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
> an incorrect bounds check in the following:
> 
> ""
>        if (newport > serial->num_ports) {
> 	       dev_err(&port->dev,
> 		       "%s - port change to invalid port: %i\n",
> 		       __func__, newport);
> 	       break;
>        }
> ""
> 
> The condition doesn't account for the valid range of the serial->port
> buffer, which is from 0 to serial->num_ports - 1. When newport is equal
> to serial->num_ports, the assignment of "port" in the
> following code is out-of-bounds and NULL:
> 
> ""
>        serial_priv->current_port = newport;
>        port = serial->port[serial_priv->current_port];
> 
> ""
> 
> The fix checks if newport is greater than or equal to serial->num_ports
> indicating it is out-of-bounds.
> 
> Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
> Tested-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> Tested-by: Qasim Ijaz <qasdev00@gmail.com>
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Your signed-off-by does not match your "From:" line :(

Also, no need to add a tested-by when you sign off on your own patch,
that is usually implied.

thanks,

greg k-h

