Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612E71CFEFE
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 22:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731020AbgELUIf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 16:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELUIf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 16:08:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EBBC061A0C
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 13:08:34 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v12so17358948wrp.12
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ON815FfrXGaL3Rxykv2ZRoZ7jPTV9wND7MXnWzaxQVA=;
        b=sndNfgh4hL0nJ+TWsc0kRZHVu0OI2YutShkza14zdffHmXnoSpS7DRTrFBn5nVjLbA
         uyoo9Qdq2E+g7/AV6S+thf/3bxuxpSulnm2fEbilBbq0hlqiwVb49e/ccZJtlWn7MrKY
         VzRUTdQ8tahADLYh5lb5bdAot/qoc+33FBR7wJPrL2IQ3iqYxTm13HEGnk/APiaGNQP8
         iO+GbQDlTAq26Qxwu4sBj1iDdqCLSTHOiMqWRH4QEYGMrLnt0TrdIuBNuxlrPBm2HyUS
         zLfeJJqKV6ck8rjQP1XiBnZdx2ajsJQjOHgIEeos2o1zMJQo901ketOCj/XI3gXBIq+5
         VEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ON815FfrXGaL3Rxykv2ZRoZ7jPTV9wND7MXnWzaxQVA=;
        b=CZqs10plk2Q01itR+2ubPoLs3A7IirldEO072eON96zoWedyNIjI8L7TeQHNNBH5zf
         pdA6FEtsZ0C4gtuYwqqr22Piv/Kt+esIKiBCbC/VjMWY1uY0JM0kJ//nci52WAuj99ZH
         SSNEWHUTNL0OYHbbr3sMmRhjAFr+YL74jNEW2+bbO3ZlxwFM3imw67qr2jCx8GobKVLQ
         q0WKPN854Vi3lvq9HnLKsQQNkXNwlti1zt9QlVFYZFD12aPhe5rzEMkfwdZN41Utk6Gg
         nkmRf7vJJQuVY0n7+gFcLib0eTbOPgtaFpDbuwhddFNlYG9O3MrsSA3029bG+OeVM14+
         rNUQ==
X-Gm-Message-State: AGi0Pub8+p3bkN9z/6mCAYZUkpFE5FJ5dpjouyM4Tmlw674ELB7eBTTB
        hVi9ajJc7v25O+0pfu9+S5cj45oZ
X-Google-Smtp-Source: APiQypIOPex2wTEIN19n+6FkFYwi4phTbfEtSnfLUhfCURXDw69SzDYmiLVuhBrwaXOIbWpQEQdq3Q==
X-Received: by 2002:adf:c508:: with SMTP id q8mr25534508wrf.4.1589314113417;
        Tue, 12 May 2020 13:08:33 -0700 (PDT)
Received: from [192.168.1.41] (2-108-107-206-static.dk.customer.tdc.net. [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id a8sm24591635wrg.85.2020.05.12.13.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:08:32 -0700 (PDT)
Message-ID: <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 12 May 2020 22:08:31 +0200
In-Reply-To: <20200512195231.GA26080@rowland.harvard.edu>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
         <20200512195231.GA26080@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On tir, 2020-05-12 at 15:52 -0400, Alan Stern wrote:
> On Tue, May 12, 2020 at 09:25:38PM +0200, Claus Stovgaard wrote:
> > 
> > In a certain scenario I would like to force the dwc3 to only
> > connect
> > via superspeed and not fall back to USB2.
> > 
> > What options exist for forcing the dwc3 to keep retry?
> 
> The USB-3 spec forbids devices from operating only at SuperSpeed.  
> Devices must be able to connect at high speed, although possibly
> with 
> reduced functionality.
> 
> Alan Stern
> 

I understand the requirement from the USB 3 specification. Though in
the scenario for this specific device, it is not about comply with the
USB 3 specification, but my question is rather what options I have for
not comply with the specification here, and then force retry of USB 3,
using the dwc3 as device.

The device is in a fixed mounting with a fixed host. Sometimes when the
host and device is powered up, it ends in high-speed instead of super-
speed. I would like the option for "I will not be compliant with USB,
but rather retry super-speed".

Regards
Claus

