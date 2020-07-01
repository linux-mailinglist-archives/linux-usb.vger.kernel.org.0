Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A1A210507
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 09:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgGAH3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 03:29:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:51368 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727981AbgGAH3W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 03:29:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E0980ADC8;
        Wed,  1 Jul 2020 07:29:20 +0000 (UTC)
Message-ID: <1593587327.2678.2.camel@suse.com>
Subject: [TEST]Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Wed, 01 Jul 2020 09:08:47 +0200
In-Reply-To: <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
References: <1590408381.2838.4.camel@suse.com>
         <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
         <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
         <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
         <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
         <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
         <20200528194057.GA21709@rowland.harvard.edu>
         <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
         <20200528205807.GB21709@rowland.harvard.edu>
         <1590852311.14886.3.camel@suse.com>
         <20200530154728.GB29298@rowland.harvard.edu>
         <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 08.06.2020, 11:24 +0900 schrieb Tetsuo Handa:

I am having mail troubles. This is a test, as mail seems not to
be delivered in this thread specifically.

	Sorry
		Oliver

