Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A751832E5B6
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 11:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCEKGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 05:06:37 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:57504 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhCEKG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 05:06:28 -0500
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 125A6G3p079531;
        Fri, 5 Mar 2021 19:06:16 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Fri, 05 Mar 2021 19:06:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 125A6Gre079524
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 19:06:16 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v4 00/12] usb: usbip: serialize attach/detach operations
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <353d42fe-d730-63bb-7d40-33ee67d20411@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <54519d84-9173-21d4-8347-d53500b32092@i-love.sakura.ne.jp>
Date:   Fri, 5 Mar 2021 19:06:14 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <353d42fe-d730-63bb-7d40-33ee67d20411@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/03/05 0:52, Shuah Khan wrote:
> As I said, it uses a simpler approach and reduces the number
> of changes. I would rather go with what I am working on.

Will you post it to ML so that people can review?
