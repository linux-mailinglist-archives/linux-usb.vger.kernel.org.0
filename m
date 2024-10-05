Return-Path: <linux-usb+bounces-15759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E983991526
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 09:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941541C203DA
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 07:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF0D8615A;
	Sat,  5 Oct 2024 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wdgo+ZJo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C19322B
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728114626; cv=none; b=feQSsAApRDOLobSBz8TVCXWVyY/1KPEDLSlUZptlQIwnAjQJNg0QznfEiwA2lkB/jK6E41hUGMg+Z69dzy1JBOFtoyiMx0lRdIzGffOdo/gNYnCzi7w9bjqr5WRZtIYRD73fGvhvLo1eXXdHVqpUmXb/p6dSOlQFLQu7gUf4+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728114626; c=relaxed/simple;
	bh=G/tG0xYXHag0eVdn+heCg/pvphewTRCP5QBTPAnqHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzgPMMCWrBkY+NxQi1jf8Gmxk9ddEvav+X1xbNUAm6GH2g0WLMyI7s1p01Rv1bGsrpwoQFTy82TrZ1Va0sWPzwreWafdIwkKI/sdQqSMVjTWtplXwj3rRuNqMBQM5yXxpCEZAIOuk8Qq02zJgHFq8uGKsiVHTUKC2J39lLzMLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wdgo+ZJo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9ABC4CEC2;
	Sat,  5 Oct 2024 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728114625;
	bh=G/tG0xYXHag0eVdn+heCg/pvphewTRCP5QBTPAnqHSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wdgo+ZJo0evvkCHF1dZWzkBihkjoP6F59b6ODFBukYaWHFou1T9mjlmZVIPh0UYNC
	 Wrn51SRZlzKHxb3fqaVVVcdQ086Z4AG3XdoS8qH/7Z6xUBNgY8ttEzHTdmVTUuoSMw
	 S80uii8HAAkmoKoqoPWz2msjGBmp74CwRIW4VlTM=
Date: Sat, 5 Oct 2024 09:50:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manuel <sakunix@yahoo.com>
Cc: "duncan.sands@free.fr" <duncan.sands@free.fr>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: atm: speedtch: do not use assignment in if condition
Message-ID: <2024100530-wavy-upturned-7adb@gregkh>
References: <20241004030512.2036-1-sakunix.ref@yahoo.com>
 <20241004030512.2036-1-sakunix@yahoo.com>
 <2024100400-whiff-unspoiled-0e1a@gregkh>
 <1373831583.16353031.1728076035398@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1373831583.16353031.1728076035398@mail.yahoo.com>

On Fri, Oct 04, 2024 at 09:07:15PM +0000, Manuel wrote:
> El jueves, 3 de octubre de 2024, 23:20:08 GMT-7, Greg KH <gregkh@linuxfoundation.org> escribió: On Thu, Oct 03, 2024 at 08:05:12PM -0700, Manuel Quintero F wrote:> Fix checkpatch error "do not use assignment in if condition"> > Signed-off-by: Manuel Quintero F <sakunix@yahoo.com>> Signed-off-by: Manuel Quintero F <sakunix@yahoo.com>
> 
> Why twice?
> 
> When I checked the patch it was not signed twice.

Odd quoting style...

Anyway, when you look at the patch you sent, it was signed twice, so
something went wrong on your end :(

> Thanks for the info, should I correct the blank line and send you version 2 of the patch?

Please get more experience in the drivers/staging/ portion of the kernel
before going out beyond that portion.

thanks,

greg k-h

