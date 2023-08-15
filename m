Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6C577C4D7
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 03:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbjHOBC1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Aug 2023 21:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbjHOBCC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Aug 2023 21:02:02 -0400
Received: from vps3.drown.org (vps3.drown.org [96.126.122.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B31A6
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 18:02:01 -0700 (PDT)
X-Envelope-From: dan-netdev@drown.org
Received: from f9ae53fa8754 (unknown [10.1.4.4])
        by vps3.drown.org (Postfix) with ESMTPSA id 312833A055C;
        Mon, 14 Aug 2023 20:02:01 -0500 (CDT)
X-Mailer: Cypht
MIME-Version: 1.0
Cc:     <linux-usb@vger.kernel.org>
In-Reply-To: <33cd7324-f2a7-1b85-f747-29aa6c4f4941@suse.com>
From:   Dan Drown <dan-netdev@drown.org>
Reply-To: dan-netdev@drown.org
To:     Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: cdc-acm: add PPS support
Date:   Mon, 14 Aug 2023 20:02:01 -0500
Message-Id: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
Content-Type: multipart/mixed; boundary=olCOOmooTBaiRIyfY2n7oSsckCOR97YsIpDJH6IvfZ3fJQLsz6DMf7t3DW5FWMQ
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--olCOOmooTBaiRIyfY2n7oSsckCOR97YsIpDJH6IvfZ3fJQLsz6DMf7t3DW5FWMQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Aug 2023 14:32:57 +0200 Oliver Neukum oneukum@suse=2Ecom said
> On 06=2E08=2E23 04:26, Dan Drown wrote:
> > This patch adds support for PPS to CDC devices=2E Changes to the DCD pin
> > are monitored and passed to the ldisc system, which is used by
> > pps-ldisc=2E
>
> do we really want to do this with acm>read_lock held?

Looks like it was put there to protect the iocount changes in the surroundi=
ng code=2E Are your concerns around performance or deadlocks?


