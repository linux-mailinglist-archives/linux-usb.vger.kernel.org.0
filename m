Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34902215363
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 09:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgGFHkP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 03:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728248AbgGFHkP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 03:40:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 619B820724;
        Mon,  6 Jul 2020 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594021215;
        bh=c8sf5E7PnXlcyvu0Z/xBV+v5sVpy/lr3mrIT7nTR1kk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hxbkBo28hOIGnO/00pE2euJgFT6WtjxG16k/PxkTFPTrNwAuRQ6oYZdb9xJb7SOuu
         fOuaBMsEAxITZHfN0EL/9KBr4pyL8nSVsu6qkKGoM6Qs7+HnXmHhbUx/mu1FQeaC3V
         QEBYtGdHDA/Y+595B839xJEkopZLsbqIxGDaiiYE=
Date:   Mon, 6 Jul 2020 09:40:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     balbi@kernel.org, colin.king@canonical.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: function: fix missing spinlock in
 f_uac1_legacy
Message-ID: <20200706074015.GA1949998@kroah.com>
References: <20200705015941.40485-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705015941.40485-1-qiang.zhang@windriver.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 05, 2020 at 09:59:41AM +0800, qiang.zhang@windriver.com wrote:
> From: Zhang Qiang <qiang.zhang@windriver.com>
> 
> Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>

No changelog text?  I can't take patches like that, sorry.

greg k-h
