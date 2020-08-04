Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8873C23B77B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Aug 2020 11:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbgHDJRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Aug 2020 05:17:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:40006 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgHDJRl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Aug 2020 05:17:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D7F87AD25;
        Tue,  4 Aug 2020 09:17:55 +0000 (UTC)
Message-ID: <1596532658.19923.6.camel@suse.com>
Subject: Re: [PATCH] cdc-acm: rework notification_buffer resizing
From:   Oliver Neukum <oneukum@suse.com>
To:     trix@redhat.com, gregkh@linuxfoundation.org, t-herzog@gmx.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 04 Aug 2020 11:17:38 +0200
In-Reply-To: <20200801152154.20683-1-trix@redhat.com>
References: <20200801152154.20683-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 01.08.2020, 08:21 -0700 schrieb trix@redhat.com:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this error
> 
> cdc-acm.c:409:3: warning: Use of memory after it is freed
>         acm_process_notification(acm, (unsigned char *)dr);
> 
> There are three problems, the first one is that dr is not reset

Hi,

thank you, good catch.

	Regards
		Oliver

