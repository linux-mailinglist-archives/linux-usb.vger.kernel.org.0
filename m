Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA36134803
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 17:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgAHQcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 11:32:17 -0500
Received: from muru.com ([72.249.23.125]:50454 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgAHQcR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 11:32:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6D2B580C5;
        Wed,  8 Jan 2020 16:32:58 +0000 (UTC)
Date:   Wed, 8 Jan 2020 08:32:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: remove dummy driver musb_am335x.c
Message-ID: <20200108163214.GE5881@atomide.com>
References: <20200108022806.32061-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108022806.32061-1-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Bin Liu <b-liu@ti.com> [200108 02:24]:
> Since commit 0782e8572ce4 ("ARM: dts: Probe am335x musb with ti-sysc"),
> the dummy driver musb_am335x.c is no longer needed, let's drop it.

Acked-by: Tony Lindgren <tony@atomide.com>
