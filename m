Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF1E410B77
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 14:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhISMIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Sep 2021 08:08:37 -0400
Received: from rosenzweig.io ([138.197.143.207]:46664 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230333AbhISMIe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 08:08:34 -0400
Date:   Sun, 19 Sep 2021 07:28:36 -0400
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alexander Graf <graf@amazon.com>
Subject: Re: [RFT PATCH 3/9] usb: typec: tipd: Allow irq controller selection
Message-ID: <YUce5EcD7Pys5Z4s@sunset>
References: <20210918120934.28252-1-sven@svenpeter.dev>
 <20210918120934.28252-4-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918120934.28252-4-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(Asked off list for completeness) use_int2 is always true in this series , so I'm not sure it makes sense to configure it. But for symmetry I think it's good, so

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

