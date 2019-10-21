Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC69EDF0F3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 17:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfJUPLa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 11:11:30 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41577 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbfJUPLa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 11:11:30 -0400
Received: by mail-qt1-f193.google.com with SMTP id c17so18521259qtn.8
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qS61X+5m6MtQel9VqUWIBehON3s+q99p7coyrGJ4cKk=;
        b=vgMa8zyvQJiITbDRhH476SyrF8qEzpJ/h3K0Ry0C3OMWvoWTxVtZr8x8I/VBQNGrof
         z9zvAJfXeIbBHgjFiZhiadHPUnD9EqAemuXZlvLIYOV1y6I7xZQZHAbHJ3kaiYA3KEfn
         ww3Kvw4Uatg7zhZ7c4GnzpMZLNYxBSJ6tl17U3nAIFZGEwx5mbkNRTypnaSUpbF5YHsT
         lvL2Yeajm7W/4LefinH34AGKVPOj7rIcemvCrGy/GAzdN7TCr/onZN0UFuKbNWrNAp7m
         YfFOMRhd5qIVrc/q6AqqKLRllSTynBEvetFndNpTjw/c5Oy163tWGP6ZjhXRY/VAdY9h
         ikAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qS61X+5m6MtQel9VqUWIBehON3s+q99p7coyrGJ4cKk=;
        b=mO3zEvPSs/w8wJCfzgzuqLUN62EMAlVF4ZlBK1YNa6OMQZHa3GkvO5aMmkbdcZW/ia
         POcL70AqihwsubPnyEW+uRQYntgsOxax6Y8H70IwhaCSVjomCd861Lj13qCRt56c1JL0
         j9BE2/KBhYi7utduhs+r2iGvKKgaGuxblEwCHQgFG1FJVds37rVtdN05RukvIE13KyFi
         vQen7JdI/23Dlyl3IyvrgCXXfe+Me+MhEfpmQZYlo1z1+nsicLAAIyzKfB/q4AoMrYLT
         A868ukQ9MwMeyoNkmtMtauHXA++XVgZbiLsvZXKIqSLkJJCOCWjwvkIz1RZhtZp3I29h
         c18g==
X-Gm-Message-State: APjAAAVm4g9mVZETyRwcxEZtLProOwUnhn74Nj2GnjcdBYuVm+edomUn
        anYCxQJ613u7Sebsh2NjdNc=
X-Google-Smtp-Source: APXvYqzmuFowScAN02siq8H9RgVhPEWqtyZRUjKFXxIogVZHO38gNQ6YQ+fNUE5eOEkhRivBHtk95A==
X-Received: by 2002:a0c:95d2:: with SMTP id t18mr24504534qvt.50.1571670687431;
        Mon, 21 Oct 2019 08:11:27 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id y10sm8055294qkb.55.2019.10.21.08.11.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 08:11:27 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Mon, 21 Oct 2019 11:11:25 -0400
To:     Ben <ben@besd.de>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, hch@lst.de
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
Message-ID: <20191021151125.GA448778@rani.riverdale.lan>
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
 <5328c3b3-d527-42a6-d3b8-18a4ef842227@besd.de>
 <20191020205529.GA2451134@rani.riverdale.lan>
 <4c219b83-4e29-6042-4a73-5bba6a721554@besd.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c219b83-4e29-6042-4a73-5bba6a721554@besd.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 21, 2019 at 07:04:45AM +0200, Ben wrote:
> Thanks,
> 
> I could have sworn I checked lkml. Thanks for the fix!
> 
> Any idea why only ehci is affected?
> 
> Seems a bit odd, that's why I thought it would be a problem with usb driver.
> 

I'm not sure -- in theory at least, it should affect any device that
uses DMA and supports at least 32-bit DMA, but not enough to cover all
of RAM. On my system that seems to be only ehci and my GPU (which only
supports 32-bit coherent DMA, apparently), going by dmesg.

Note that a workaround is to disable iommu=pt, it's not a problem unless
you're trying to use passthrough with that device.
