Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60651DE090
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2019 22:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfJTUzf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Oct 2019 16:55:35 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34900 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfJTUzf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Oct 2019 16:55:35 -0400
Received: by mail-qk1-f194.google.com with SMTP id w2so10481403qkf.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2019 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xprtaVLLRocAwDuKpYGwwGyqUyANfK4gHcGmtZilAgQ=;
        b=bKK8f9dv4akHL1shbXd9m7KZmnuj82fNp4YRQYSk60k6W9o9JEIEAtxmohxsod5RI/
         AhByzJhllMTvb/PesQAI4l6e+RWY8EvbxhljeSajBFclTwwZT0lm4htdGp+DZGEY8dQB
         Zts+dp98BKH9ZGqHX7QBwuoFlHPKAlavt6GVRXDsJO8EUcFtVctal4yNgz7xuke3JiCm
         v9cOh44F7nrNbKRt+gMB7ap4y0XKs9rdVtHMLVdGLuhdWq8pxPPvVuWXGUyYGX4NXz+7
         4PBCRZQQpVKQ/qzu85NQQfrsKYgo8Zz1hYCAu6t0IhTMcrcUiAdvkgRUObC2MNn6Tugs
         PzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xprtaVLLRocAwDuKpYGwwGyqUyANfK4gHcGmtZilAgQ=;
        b=UHy+1SmEIyCRhaJIop0O9ev3BVwae/ho6/fN5UahRUgzf4rhWQ+4qbXn7hGVE0e/f4
         zjCwBoMqWrckW/cRonacBm76Dsok7oChXCEHJ0bNOVOTpnXPNZ8PYc278wTslzJkuelm
         J5/tn+F9OFAkv0oy6Lfn2AYqkZsUmfM2qSxwekyRuTxJFYbqNvS/sx98MyNFaL8VSwZn
         +WiOHRfK1fLepRI/6ui6sjctQGxbGpYw3Ej4kGUGFk/OQ76Wy4USywWMNJirLwz/xobH
         kp7yK4XTTGhuiTIfdUKBk6qliR7VGHtW6vUqUbYlmffHbGKGiTDOCOZKe/pqc998cTOc
         hdXQ==
X-Gm-Message-State: APjAAAXrpVQT9UYTn+nGuHjdzxzCmvgXq9zBW+lfhy+HlZZTURvjKnqm
        9M/t98QX0Gr674LtYR5M9YjqKXnoD2s=
X-Google-Smtp-Source: APXvYqycecsrpJ0VmJpRHNBEhKDthJIouq/RlHVgdOx7OhYktBkfvZh8FisDoSs/RFd7f3DCUqRCPg==
X-Received: by 2002:a05:620a:38d:: with SMTP id q13mr17892487qkm.314.1571604933857;
        Sun, 20 Oct 2019 13:55:33 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id g10sm6770682qkm.38.2019.10.20.13.55.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 13:55:33 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Sun, 20 Oct 2019 16:55:31 -0400
To:     Benedikt Schemmer <ben@besd.de>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        hch@lst.de
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
Message-ID: <20191020205529.GA2451134@rani.riverdale.lan>
References: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
 <5328c3b3-d527-42a6-d3b8-18a4ef842227@besd.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5328c3b3-d527-42a6-d3b8-18a4ef842227@besd.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 19, 2019 at 02:52:16PM +0200, Benedikt Schemmer wrote:
> reverting that specific commit on top of todays linux git (d418d070057c) produces a good kernel

Hi Ben, the fix is in https://lore.kernel.org/lkml/20191008143357.GA599223@rani.riverdale.lan/
> 
> Am 18.10.19 um 00:31 schrieb Alan Stern:
> > On Thu, 17 Oct 2019, Benedikt Schemmer wrote:
> > 
> >> Hi all,
> >>
> >> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
> >> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
> >> with the 5.3 series up to 5.3.6
> > 
> > Can you use git bisect to track the problem down to a particular commit?
> > 
> > Alan Stern
> > 
