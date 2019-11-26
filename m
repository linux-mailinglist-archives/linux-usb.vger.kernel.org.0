Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B489310A651
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 23:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfKZWEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 17:04:14 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:42858 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfKZWEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 17:04:14 -0500
Received: from localhost (c-73-35-209-67.hsd1.wa.comcast.net [73.35.209.67])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D970B14D44125;
        Tue, 26 Nov 2019 14:04:12 -0800 (PST)
Date:   Tue, 26 Nov 2019 14:04:12 -0800 (PST)
Message-Id: <20191126.140412.327150078421405319.davem@davemloft.net>
To:     tranmanphong@gmail.com
Cc:     alexios.zavras@intel.com, allison@lohutok.net, benquike@gmail.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, oneukum@suse.com, tglx@linutronix.de
Subject: Re: [Patch v2 0/2] Fix -Wcast-function-type usb net drivers
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191126135413.19929-1-tranmanphong@gmail.com>
References: <20191125.110708.76766634808358006.davem@davemloft.net>
        <20191126135413.19929-1-tranmanphong@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 26 Nov 2019 14:04:13 -0800 (PST)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Phong Tran <tranmanphong@gmail.com>
Date: Tue, 26 Nov 2019 20:54:11 +0700

> Change log with v1:
>  - Modify suffix of patch subject.
>  - Did the checkpatch.pl (remove the space, add a blank line).

Series applied, thanks.
