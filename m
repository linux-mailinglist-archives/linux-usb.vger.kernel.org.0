Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB20172F19
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 04:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbgB1DD1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 22:03:27 -0500
Received: from kernel.crashing.org ([76.164.61.194]:37276 "EHLO
        kernel.crashing.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgB1DD1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 22:03:27 -0500
Received: from localhost (gate.crashing.org [63.228.1.57])
        (authenticated bits=0)
        by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01S32TN4031937
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 27 Feb 2020 21:02:32 -0600
Message-ID: <2676013663fc8c53e02a5fdaafb1b27e18249b80.camel@kernel.crashing.org>
Subject: Re: [PATCH v5 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Tao Ren <rentao.bupt@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, taoren@fb.com,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-arm-kernel@lists.infradead.org
Date:   Fri, 28 Feb 2020 14:02:28 +1100
In-Reply-To: <20200228010444.GA19910@taoren-ubuntu-R90MNF91>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
         <20200227230507.8682-8-rentao.bupt@gmail.com>
         <3150424b9e9f5856c747a0fbf44647919f49209d.camel@kernel.crashing.org>
         <20200228010444.GA19910@taoren-ubuntu-R90MNF91>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-02-27 at 17:05 -0800, Tao Ren wrote:
> > Also long run I think best is going to have a child node per downstream
> > port, so we create a matching linux struct device. This will make it
> > easier to deal with the other device-controller in the ast2600 which is
> > basically one of these without a vhub above it.
> 
> Maybe a dumb question: what would be the proper place to parse the child
> node/properties when they are added? For example, in some usb_gadget_ops
> callback?

No. What the vhub would do is when it probes, it creates a platform
device for each "port" child node that's linked to the DT node.

The driver for the device then attaches to it via standard DT matching
and checks if it has a vhub parent or not, and based on that, operates
as a vhub child device or a standalone one.

(For example, it might have different functions for EP selection since
standalone devices have private EPs rather than a shared pool)

They can both be in the same module or they can be separate modules
with cross dependencies.

Cheers,
Ben.


