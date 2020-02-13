Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05B815BD89
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 12:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgBMLQr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 06:16:47 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49113 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgBMLQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 06:16:47 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E7D11C000C;
        Thu, 13 Feb 2020 11:16:44 +0000 (UTC)
Message-ID: <a23326d0c6a0a8e849fe7674f9ef68158d1ffcea.camel@hadess.net>
Subject: Re: [PATCH] apple-mfi-fastcharge: fix endianess issue in probe
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Date:   Thu, 13 Feb 2020 12:16:44 +0100
In-Reply-To: <20200213111336.32392-1-oneukum@suse.com>
References: <20200213111336.32392-1-oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-02-13 at 12:13 +0100, Oliver Neukum wrote:
> The product ID is little endian and needs to be converted.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: kbuild test robot <lkp@intel.com>

Looks good, thanks for the quick fix!

Reviewed-by: Bastien Nocera <hadess@hadess.net>

