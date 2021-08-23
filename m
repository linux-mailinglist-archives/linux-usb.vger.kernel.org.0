Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722F13F5048
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 20:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhHWSVK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 14:21:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:58420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229985AbhHWSVK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 14:21:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45BE26136F;
        Mon, 23 Aug 2021 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629742827;
        bh=fUE0P3wg1aGL6PbauP9PILbIetDkOh/UoNZ2jnWFJDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g9CS1BXFLKAvC2FvoizgORnltoTMwY1Soysicv2gzKvokBmq1Ekr5A3X23S9viRr1
         Cc8oTA++6qzf7rRZLsRFHn4I9aR/bqNVGudRZi46QL7QmiOW+scS/WplAj+LBqLAxh
         V9393t/v1lVJ1IaUWDJB0iEgTs66VIHIhmhiCgaE=
Date:   Mon, 23 Aug 2021 20:20:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH V3] usb: gadget: configfs: add three trace entries
Message-ID: <YSPm5aJYHewc1Xvy@kroah.com>
References: <1629682240-8207-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629682240-8207-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 23, 2021 at 09:30:40AM +0800, Linyu Yuan wrote:
> when debug USB gadget issue, it is better to understand
> what configuration was done from user space.
> 
> add trace in function gadget_dev_desc_UDC_store()
> will show when user space enable/disable the gadget.
> 
> add trace in function config_usb_cfg_link()
> will show which function was added to gadget configuration.
> 
> add trace in function config_usb_cfg_unlink()
> whill show which function was removed from gadget configuraion.

This needs to be 3 different patches, right?  Please resubmit this as a
patch series as you are doing 3 different things all at once.

thanks,

greg k-h
