Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D195410B74
	for <lists+linux-usb@lfdr.de>; Sun, 19 Sep 2021 14:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhISMIf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Sep 2021 08:08:35 -0400
Received: from rosenzweig.io ([138.197.143.207]:46658 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229664AbhISMIe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Sep 2021 08:08:34 -0400
Date:   Sun, 19 Sep 2021 07:31:55 -0400
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
Subject: Re: [RFT PATCH 6/9] usb: typec: tipd: Setup IntMask explicitly
Message-ID: <YUcfqyBBJTWxpT2n@sunset>
References: <20210918120934.28252-1-sven@svenpeter.dev>
 <20210918120934.28252-7-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918120934.28252-7-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This seems reasonable (and has my Tested-by on the M1) but I don't know
enough about non-apple TPS to feel comfortable reviewing.
