Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20B43282EA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237470AbhCAQAK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 11:00:10 -0500
Received: from netrider.rowland.org ([192.131.102.5]:50797 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237135AbhCAQAI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Mar 2021 11:00:08 -0500
Received: (qmail 1490911 invoked by uid 1000); 1 Mar 2021 10:59:27 -0500
Date:   Mon, 1 Mar 2021 10:59:27 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Christoph Hellwig <hch@lst.de>, Hans de Goede <hdegoede@redhat.com>
Cc:     Tom Yan <tom.ty89@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb-storage: revert from scsi_add_host_with_dma() to
 scsi_add_host()
Message-ID: <20210301155927.GB1490228@rowland.harvard.edu>
References: <186eb035-4bc4-ff72-ee41-aeb6d81888e3@redhat.com>
 <X8T0E2qvF2cgADl+@kroah.com>
 <dd557c38-a919-5e5e-ab3b-17a235f17139@redhat.com>
 <20201130172004.GA966032@rowland.harvard.edu>
 <abb0a79d-63a0-6f3d-4812-f828283cd47c@redhat.com>
 <CAGnHSEk1GixNK71CJMymwLE=MyedjCkiG5Ubq1=O_wFxBBM0GQ@mail.gmail.com>
 <CAGnHSEmPpbDokAfGkeCkvo3JuYfnosVt8H+TK7ZWFNsdyWAfYQ@mail.gmail.com>
 <20201130203618.GB975529@rowland.harvard.edu>
 <20210225163557.GC1350993@rowland.harvard.edu>
 <20210226055352.GA2996@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226055352.GA2996@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 26, 2021 at 06:53:52AM +0100, Christoph Hellwig wrote:
> On Thu, Feb 25, 2021 at 11:35:57AM -0500, Alan Stern wrote:
> > This thread seems to have fallen through the cracks.  Maybe now would be 
> > a good time to address the problem (since we originally planned to fix 
> > it in 5.11!).
> > 
> > The questions listed below are pretty self-contained, although the rest
> > of the discussion isn't.  But I never received any answers.
> 
> usb-storage must use scsi_add_host_with_dma to use the right device
> for DMA mapping and parameters.  The calls to set the DMA options
> on the device are needed so that IOMMU merging doesn't change the
> imposed requirements.  If these requirements slow you down you need
> to relax them, as apparently the hardware is able to handle bigger
> limits.

Hans, don't you have the right equipment to test this approach?

Alan Stern
