Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B10182C26
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 10:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgCLJPs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 05:15:48 -0400
Received: from laas.laas.fr ([140.93.0.15]:17480 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgCLJPs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 05:15:48 -0400
Received: from lotus.useless-ficus.net (lotus.laas.fr [140.93.68.112])
        (authenticated bits=0)
        by laas.laas.fr (8.16.0.21/8.16.0.29) with ESMTPSA id 02C9Fd9O047621
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 12 Mar 2020 10:15:40 +0100 (CET)
Received: by lotus.useless-ficus.net (Postfix, from userid 1000)
        id BEA344C074F; Thu, 12 Mar 2020 10:15:39 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24169.64955.621393.134996@gargle.gargle.HOWL>
Date:   Thu, 12 Mar 2020 10:15:39 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
In-Reply-To: <20200312083827.GA102663@kroah.com>
References: <20200310101027.32152-1-anthony.mallet@laas.fr>
        <20200310101027.32152-2-anthony.mallet@laas.fr>
        <20200312083827.GA102663@kroah.com>
X-Mailer: VM 8.2.0b under 25.2.2 (x86_64-pc-linux-gnu)
Organization: LAAS/CNRS - Toulouse - France
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday 12 Mar 2020, at 09:38, Greg KH wrote:
> This patch doesn't apply to my usb-linus branch at all.  What
> tree/branch did you make it against?

This is against master of https://github.com/torvalds/linux.git
