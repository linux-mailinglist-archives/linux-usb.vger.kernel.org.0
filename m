Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9584015273B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 08:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgBEHyC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 02:54:02 -0500
Received: from smtp.mujha-vel.cz ([81.30.225.246]:43967 "EHLO
        smtp.mujha-vel.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgBEHyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 02:54:02 -0500
Received: from [81.30.250.3] (helo=[172.16.1.2])
        by smtp.mujha-vel.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jn@forever.cz>)
        id 1izFVW-0000YX-KS; Wed, 05 Feb 2020 08:53:59 +0100
Subject: Re: ch341 garbage read with 5.5.x kernel
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
 <20200205074312.GP26725@localhost>
From:   jakub nantl <jn@forever.cz>
Message-ID: <fb82eb2f-ff8d-1e02-2f48-9667c86742a4@forever.cz>
Date:   Wed, 5 Feb 2020 08:53:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205074312.GP26725@localhost>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05. 02. 20 8:43, Johan Hovold wrote:
> There were some fixes to the baudrate handling that went into 5.5 that
> are likely related to this.
>
> These changes provide more accurate output rates, but I have since
> received one report that it may inadvertently have made the device more
> sensitive to errors in the input rate. In that case, the reporter
> switched to a baudrate that matches his actual rate which was 117647
> rather than 115200 (i.e. 2.1% error) and that addressed the problem.
>
> Which baudrate are you using here?

my baudrate is 115200, how can I get "my" actual rate ?

jn

