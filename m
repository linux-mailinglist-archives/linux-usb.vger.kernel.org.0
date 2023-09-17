Return-Path: <linux-usb+bounces-264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E137A3435
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 10:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A3411C2087C
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 08:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6407187D;
	Sun, 17 Sep 2023 08:00:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7891859
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 08:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7335C433C7;
	Sun, 17 Sep 2023 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694937604;
	bh=4oKIojBtbdhazQAdibjIiUwQ0qtTnnpVA3Wusbxf19c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKfFcm2KhzGmJWCQuzP8SNrYVu7REWG40HglYATErmAQbYQSHlMVuG+SwbcLWEZwD
	 KI4onFBHDk8XL3+BdIpmqNaHPt7KrEgliEBTtvOX4sEbIzkN1x2mloKZol6eTr7PPs
	 qk/7yC72GEjnr23QZG5AK9GNNkzD9tjdWV+p1BB0=
Date: Sun, 17 Sep 2023 10:00:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 /3] usb: dwc3: trace: reduce buffer usage of trace
 event
Message-ID: <2023091714-outer-deem-fb64@gregkh>
References: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
 <20230915052716.28540-4-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915052716.28540-4-quic_linyyuan@quicinc.com>

On Fri, Sep 15, 2023 at 01:27:16PM +0800, Linyu Yuan wrote:
> Save u32 members in __le32 format into trace event ring buffer and parse
> it for possible bit fields.
> 
> Use new common trace event macro in gadget.h for output stage.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/dwc3/trace.h | 63 ++++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 34 deletions(-)

Your subject line is broken.

Stop, take some time and rethink this series, and get someone in your
group/company to review it before submitting it again.  You seem to be
ignoring our review comments which just makes me want to ignore the
patches entirely, which I do not think you want to have happen :(

greg k-h

