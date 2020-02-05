Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2E501530CA
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 13:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgBEMbM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 07:31:12 -0500
Received: from smtp.mujha-vel.cz ([81.30.225.246]:41331 "EHLO
        smtp.mujha-vel.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgBEMbM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 07:31:12 -0500
Received: from [81.30.250.3] (helo=[172.16.1.2])
        by smtp.mujha-vel.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jn@forever.cz>)
        id 1izJpi-0007Hk-Qo; Wed, 05 Feb 2020 13:31:07 +0100
Subject: Re: ch341 garbage read with 5.5.x kernel
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
 <20200205074312.GP26725@localhost>
 <fb82eb2f-ff8d-1e02-2f48-9667c86742a4@forever.cz>
 <20200205085043.GR26725@localhost>
From:   jakub nantl <jn@forever.cz>
Message-ID: <f93e2b85-44c4-315a-9adb-6677fc362757@forever.cz>
Date:   Wed, 5 Feb 2020 13:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205085043.GR26725@localhost>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05. 02. 20 9:50, Johan Hovold wrote:
> Can you try the below patch which restores a component included in the
> first version of the new algorithm, but which I ultimately deemed
> redundant?

Hello Johan,

your patch has helped, thanks...

jn

