Return-Path: <linux-usb+bounces-825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 160787B407D
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 568A9281F56
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 13:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6106D1173B;
	Sat, 30 Sep 2023 13:31:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A5524E
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 13:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A8FC433C8;
	Sat, 30 Sep 2023 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696080705;
	bh=Obhs2CedT2ML1ULT+XIBom7a5rHC33HyXVw1sPI2hKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5V+CbfLPhYkbLK/aAjYFEfMLJneT/JLoFjwTIkYV6XQebhZIysNX6XZ1nkr4TGC8
	 wSkWKvwx5hI0qynSplvto6NxEu6lDiq4ezoneEbuMi+nY1adqBFkbNK/RHJBbBM0pi
	 GW4u8D3keCsO5TTlM+mV5fmGozHvB924eczAqCFQ=
Date: Sat, 30 Sep 2023 15:31:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav <singhabhinav9051571833@gmail.com>
Cc: stern@rowland.harvard.edu, benjamin.tissoires@redhat.com,
	mathias.nyman@linux.intel.com, hdegoede@redhat.com,
	hadess@hadess.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] fixed documentation warning about duplicate symbol
Message-ID: <2023093020-discern-dispersed-7dbe@gregkh>
References: <20230930123449.1170359-1-singhabhinav9051571833@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930123449.1170359-1-singhabhinav9051571833@gmail.com>

On Sat, Sep 30, 2023 at 06:04:49PM +0530, Abhinav wrote:
> Compiling the documentation in html gives a warning about duplicate symbol
> because same name is used for function usb_string(...) and 
> also for the struct usb_string.Also having a different name can
> be helpful while searching or debugging the code.
> 
> Renaming the function usb_string(...) to utf16le_to_utf8(...) fixes 
> this warning.Reason for choosing this name because 
> this is what the function description says it is doing.

Odd trailing spaces, why?

Anyway, sorry, but that's a horrible function name for a usb core
function, especially just for a documentation warning?  Surely the
documentation tools can determine the difference between a structure
name and a function name?  This can't be the only place this has ever
happened, right?

Try fixing the documentation tools instead?

thanks,

greg k-h

