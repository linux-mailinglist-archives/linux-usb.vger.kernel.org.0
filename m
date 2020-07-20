Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8FC226D06
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 19:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgGTRSv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 13:18:51 -0400
Received: from yes.iam.tj ([109.74.197.121]:37664 "EHLO iam.tj"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728324AbgGTRSv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 13:18:51 -0400
Received: from [10.0.40.34] (unknown [51.155.44.233])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 2D6F1340AD;
        Mon, 20 Jul 2020 18:18:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1595265529; bh=xY4C6LY/7UCNXipn4aaYMV8JyOTlb7TTMtY1Ddxk7QU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=yWinw9tW1WaSE23AJcbrsLEdAa7p/4fC86oIAV+gwye1vnKFHaXY/SMEIa6GDhriW
         g9nKXbRITBLQqDSddFEHV+2huuOmC4wDiJ6c/lWpK831kveYLiJ6iLsscXftNIJLEI
         XIiJQ50S/ItIPcr2fdDcjbS8HVggDELpGLFiaYYTdrOwfPrEy+qFyZQI0QsozhlM+w
         k3OGz272KJFPISRX0TvbsLkXECsAzr6rw2LxFJL/ropaN7vCXcsZY2P882yhyKymRr
         L5WkR0LoThrokH7B+5Bu36Nr7rw9uKI2FHBHSOlEuQIkHIRaZIK8eUqwN/iTVpT8c4
         8XC2TwxKfXSYA==
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6 inflight:
 IN
To:     Oliver Neukum <oneukum@suse.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
 <20200719110901.GE266150@kroah.com>
 <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
 <1595235102.2531.7.camel@suse.de>
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <d22abd9c-0b04-f4a2-0f38-e271b5de2aa6@elloe.vision>
Date:   Mon, 20 Jul 2020 18:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595235102.2531.7.camel@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/07/2020 09:51, Oliver Neukum wrote:
> Am Sonntag, den 19.07.2020, 12:55 +0100 schrieb Tj (Elloe Linux):
>> On 19/07/2020 12:09, Greg KH wrote:
>>> On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:
> 
>>> Where is an error here?  Those looks ok to me.
>>
>> These repeated 'zaps' and resets every 30 seconds or so are not errors?
> 
> They are errors. But whose errors? 0x28 looks like a READ10 to me.

Update for today: setting a quirk to not use UAS allows the device to
work without any apparent failures.

usb-storage.quirks=0x152d:0x0562:u

I plan on capturing a USB debug log with and without the
quirk tomorrow.
