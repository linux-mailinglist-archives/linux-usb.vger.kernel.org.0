Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5F86B1994
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 03:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCICuU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 21:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjCICuL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 21:50:11 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 548B321A0E
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 18:49:34 -0800 (PST)
Received: (qmail 525080 invoked by uid 1000); 8 Mar 2023 21:49:33 -0500
Date:   Wed, 8 Mar 2023 21:49:33 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
Message-ID: <60be6ed0-8904-4fba-bd0f-7ecda43e8f48@rowland.harvard.edu>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
 <72b4e199-4e23-487e-a9cd-8d41993d4944@rowland.harvard.edu>
 <dc7af7b0-1e63-6662-3465-a4ec79cc265d@quicinc.com>
 <5c2c600b-7406-4944-9f59-bae65306e581@rowland.harvard.edu>
 <71a81e6f-c275-31bc-43e2-c3e34145ab9d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a81e6f-c275-31bc-43e2-c3e34145ab9d@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 09, 2023 at 10:18:22AM +0800, Linyu Yuan wrote:
> 
> On 3/9/2023 12:04 AM, Alan Stern wrote:
> > I can't offer any suggestions because I don't understand the problem you
> > want to fix, or how your patch is meant to work.
> 
> 
> Just do not think there is any problem,

If you don't think there is any problem, why did you submit your 
patches?

> do you think if we can avoid reset a hub device before it complete
> enumeration ?

No.  And I don't think there's any reason to avoid it.

On the other hand, most hubs don't get reset before they are enumerated.

Alan Stern
