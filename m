Return-Path: <linux-usb+bounces-1743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A97CC58D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D51281AD8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 14:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA6C43A97;
	Tue, 17 Oct 2023 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE782747B
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 14:06:22 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id B7D07F9
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 07:06:20 -0700 (PDT)
Received: (qmail 182604 invoked by uid 1000); 17 Oct 2023 10:06:19 -0400
Date: Tue, 17 Oct 2023 10:06:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
  USB mailing list <linux-usb@vger.kernel.org>,
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
  linux-rt-users <linux-rt-users@vger.kernel.org>
Subject: Re: USB: add check to detect host controller hardware removal
Message-ID: <d6d9478c-585b-4f51-a076-dc2955c6b2b0@rowland.harvard.edu>
References: <PH0PR11MB5191464B2F01511D2ADECB3BF1D2A@PH0PR11MB5191.namprd11.prod.outlook.com>
 <9a1074e2-c1ae-485b-b5e7-a34442c98c0b@rowland.harvard.edu>
 <20231016125624.1096766a@gandalf.local.home>
 <62fdcf97-11c6-4dee-8db1-74752d6949f3@rowland.harvard.edu>
 <PH0PR11MB5191924ECC92A8F67891D614F1D6A@PH0PR11MB5191.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5191924ECC92A8F67891D614F1D6A@PH0PR11MB5191.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 02:23:05AM +0000, Li, Meng wrote:
> I did some debugs on my side.
> Firstly, the local_irq_disable_nort() function had been removed from latest RT kernel.

What's in the RT kernel doesn't matter here, because the code you're 
patching belongs to the vanilla kernel.

> Second, because of creating xhci-pci.c, the commit c548795abe0d("USB: add check to detect host controller hardware removal") is no longer useful.
> Because the function usb_remove_hcd() is invoked from xhci_pci_remove() of file xhci-pci.c in advance.

What about for non-xHCI controllers?

> I am trying to fix this issue with getting register status directly without local_irq_disable(). 

Were you able to locate the original bug report?

Alan Stern

