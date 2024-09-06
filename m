Return-Path: <linux-usb+bounces-14789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F360496F649
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 16:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B97A1C2149A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1941CF7DC;
	Fri,  6 Sep 2024 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x0GE7CEv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E51C9EC2;
	Fri,  6 Sep 2024 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631670; cv=none; b=pynvn4/GlV/HIA9F+iL2il3IugBpNHpoBUabR64wul9TeFJxT32kEpLBdsNDOP8TKU/paGq3foAYderzsdTzI+YLMhQotOye5Wt/Yyws8A3GNXcIsOF7TwBkhsdgMXfNpR3fVdBvCY8O2ypYzss2XQon6YcG1+40HHxV77Pl7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631670; c=relaxed/simple;
	bh=vFAeDpoM03vRLQqYKnz2VReDhp3uNM7Kd+uE52jpC08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7TPxYGS2Pqy01uY7u5qRpzHUFZZUF3NK9GW0KsDM832Fg67uWRv40XVfFsPYpX9KIf/0A/jqetjRaJ7BjHv4EWyVsR8QFyLW6WKqlB+k8N3fvzr1FzdCpLPqWa8CYTZlrup4ePBzFU62WSOxTSIwABPR3tcOHzg386du34p9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x0GE7CEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198C6C4CEC4;
	Fri,  6 Sep 2024 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725631669;
	bh=vFAeDpoM03vRLQqYKnz2VReDhp3uNM7Kd+uE52jpC08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x0GE7CEvMnv1geiiFw21TdT72GjqqB+khQiXjr3OZjou3SLxWUJ6Zn2uQt2sXeOsu
	 nVFUf0hZ0dDdZMeLar1OD8543u0HUU+5hqhmN5GCx7f5LbhA9ZA0rak93uLgcIjDsn
	 Oer2Xc1s4yWaZi3hthI+HxH3hMfzN8NGwJ8HtLXw=
Date: Fri, 6 Sep 2024 16:07:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
Message-ID: <2024090608-slick-shaft-1c8b@gregkh>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
 <20240903163033.3170815-3-ukaszb@chromium.org>
 <ZtrA8y0266RTm5Z3@google.com>
 <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>

On Fri, Sep 06, 2024 at 03:53:06PM +0200, Łukasz Bartosik wrote:
> On Fri, Sep 6, 2024 at 10:44 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Tue, Sep 03, 2024 at 04:30:27PM +0000, Łukasz Bartosik wrote:
> > > From: Pavan Holla <pholla@chromium.org>
> > >
> > > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > > driver. Also, add any feature flags that are implemented by the EC
> > > but are missing in the kernel header.
> > >
> > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> >
> > Same as previous patch, it needs your S-o-b tag at the end.  See [1].
> >
> > [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
> 
> I have not added any modifications to this patch. I understand that my
> S-o-b tag is not needed in such a case. Is that not correct ?

If you are forwarding on patches from someone else, yes, you HAVE TO
sign off on it as well saying that you are allowed to do the forwarding.

thanks,

greg k-h


