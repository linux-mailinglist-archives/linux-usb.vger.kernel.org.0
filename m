Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68615294D3A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 15:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442824AbgJUNIy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 09:08:54 -0400
Received: from aibo.runbox.com ([91.220.196.211]:39484 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442821AbgJUNIy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 09:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=Q4p8BasTJx1SrhKkRq1c8Hz3hvCq4Cj7cdf652GVxpk=; b=SkS0HLzrKxX9r6unI45lwXZKEF
        uFzx6e4mrslzKui+9oh0LHPkLHC9hyvKl5ASqXUki3n10LLmx3rAN/OGxcswmgPzX8hNCrMrMbBpz
        6vJAxcp0HuXHNMtTKxuWrqTDV/obbBbLm3ahqmbRXoOCIqU9jy7dv6JE7HnSLK0Xzc8tzwFa1h8PZ
        kYEmvdyDWVXssN3YJIARs9mxmGCAiS38gnTzNfY1AzoGZAPnmR964bvcFK0N668dKW8n8Scbs0FeK
        4KztHSITDXFgVMQ6V3vgGZC2bKTZy1voqdwb/pMVf/jutHIWA9ZQckt35atEHXsK0e4n1vxW+M1Hj
        aAMHwb9g==;
Received: from [10.9.9.74] (helo=submission03.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kVDrH-0003Ee-Hj; Wed, 21 Oct 2020 15:08:51 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kVDqx-0002U1-Jp; Wed, 21 Oct 2020 15:08:31 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <20201020152859.GA945128@rowland.harvard.edu>
 <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
 <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
Date:   Wed, 21 Oct 2020 09:08:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/10/2020 07.53, Bastien Nocera wrote:
[Snipped by Vefa]
> 
> I have no idea why there isn't a match function. Patch v1 had a huge
> table:
> https://marc.info/?l=linux-usb&m=157062863431186&w=2
> and v2 already didn't had that comment, but no .match function:
> https://marc.info/?l=linux-usb&m=157114990905421&w=2
> 
> I'll prepare a patch that adds a match function. I'll let you (Vefa)
> look at which of your patches need backporting though, as I'm really
> quite a bit lost in the different patch sets and branches :/

Hello Bastien,

Having found the root cause of the issue by going through Pany's
logs and having proposed a solution, I was hoping to get credit
for the resolution of the issue by authoring the patch.

Vefa
