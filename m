Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 074DFA1319
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 09:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfH2H6W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 03:58:22 -0400
Received: from mail.aixigo.de ([5.145.142.10]:10848 "EHLO mail.aixigo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbfH2H6V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 03:58:21 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Aug 2019 03:58:21 EDT
Received: from srvvm01.ac.aixigo.de (mail.ac.aixigo.de [172.19.96.11])
        by gate5a.ac.aixigo.de (OpenSMTPD) with ESMTPS id 1773f9c3 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 29 Aug 2019 09:51:40 +0200 (CEST)
Received: from dpcl082.ac.aixigo.de (dpcl082.ac.aixigo.de [172.19.97.128])
        by srvvm01.ac.aixigo.de (8.15.2/8.15.2/Debian-8) with ESMTP id x7T7peBT174490;
        Thu, 29 Aug 2019 09:51:40 +0200
Subject: Re: fsck on ext4: "WARN Wrong bounce buffer write length: 1024 != 0"
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <22367f07-3448-f771-0363-b5c6f500b77d@aixigo.com>
 <20190827163511.GM28066@mit.edu>
 <7b5b6185-fc81-8675-06d1-fc7dae3b47b0@linux.intel.com>
From:   Harald Dunkel <harald.dunkel@aixigo.com>
Message-ID: <2be81deb-60a2-39be-b1c6-51f57937e6c7@aixigo.com>
Date:   Thu, 29 Aug 2019 09:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b5b6185-fc81-8675-06d1-fc7dae3b47b0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.1 at srvvm01.ac.aixigo.de
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/28/19 9:57 AM, Mathias Nyman wrote:
> 
> I'll submit a proper patch
> 
> -Mathias
> 

Thanx very much
Harri
