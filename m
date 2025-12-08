Return-Path: <linux-usb+bounces-31273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43BCACA5D
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 10:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46BB8305D1DE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 09:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACEB30FC0A;
	Mon,  8 Dec 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="S32jDn3c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m3292.qiye.163.com (mail-m3292.qiye.163.com [220.197.32.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777112E7BAD;
	Mon,  8 Dec 2025 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185966; cv=none; b=SFfJvv4v7iTCToqEwT/SfavFtKW8bVWyD9AIlAdLBFo70vnnzqu6sZS/hE9WdlQ9p3Fq7QKuV+A0BSVF/ksLsrBZ63x5hlw3cmB3R+Z1TyIypg4QxS3qFDciRZc7W5Yf+r/E89Vq0/sNXmAqUSPmPR+SboDO1PyIEhfSczYoMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185966; c=relaxed/simple;
	bh=uokqlPRJGXnVFrGnwKZwQMn847RpuYiTL/thTgYdDSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUI1ZI6IFNfTuhZtdLdseHb+tUThMOujAEO0oTsHtO/cMBgRblBWqHgrxIEbtdQi9425wkcqNh7N6SYdabzPkUv0GP/9BdI5rOweNtywA32ecG64jqZD5sGe1rjddK51vndazSUaQpEn73edC7RJpPMfevGsOn4hnl5zaN3dLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=S32jDn3c; arc=none smtp.client-ip=220.197.32.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c6535281;
	Mon, 8 Dec 2025 17:25:52 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 6/8] docs/zh_CN: Add ehci.rst translation
Date: Mon,  8 Dec 2025 17:25:36 +0800
Message-ID: <75e41bc6f059a071d01eedce5dd0f653ceb3fc9f.1765180570.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765180570.git.baikefan@leap-io-kernel.com>
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9afd481c9e09d5kunm314b94712b4ec94
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh5NVklDSUxKShpNGE1NHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=S32jDn3cLj891d3gR7tdApgopgzO3s28VZp1dvTBiuKCP0XKZp1cVzXLOKBt8vUR/ohNpvYDx89P8SkjpAmdkGhGyL+i4vSHISofLB+7GZMbyY57sqUYsaKl9tNXd2WgDUwj1Ln+DyIS3gYyAefkiFtMmHNliJIq5Ldf1qY6ZhBvYbkhnvcr78Spsk3AdPyCTdhmFwRvhhm5fvOEb8a9f40K2Ct7uhB4efNf63mU6IQ+LRsv1nA0+qrIyGmyy8SrLBaGHhJWN2uJc7grbScyhmsCRLh6mLaNVP8nMSUZFhWQyzBRyu8IgClcDhwmh7uY4FC4iP5ozOB6+Cn/EthCKw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=Y/x4NlCgQXEx8CZoCwHWOaTfJfdZpFnBV5rof6yh8IE=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/ehci.rst into Chinese

Update the translation through commit 570eb861243c
("docs: usb: replace some characters")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++++++++++
 .../translations/zh_CN/usb/index.rst          |   2 +-
 2 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst

diff --git a/Documentation/translations/zh_CN/usb/ehci.rst b/Documentation/translations/zh_CN/usb/ehci.rst
new file mode 100644
index 000000000000..492fc45341f4
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/ehci.rst
@@ -0,0 +1,216 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/ehci.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=========
+EHCI 驱动
+=========
+
+2002年12月27日
+
+EHCI驱动用于支持USB 2.0的主机控制器硬件与高速USB 2.0设备通信。
+USB 2.0兼容USB 1.1标准，它定义了三种传输速率：
+
+    - 高速 480 Mbit/sec (60 MByte/sec)
+    - 全速 12 Mbit/sec (1.5 MByte/sec)
+    - 低速 1.5 Mbit/sec
+
+USB 1.1仅支持全速与低速。高速设备可以在USB 1.1系统上使用，
+但速度会下降到USB 1.1的速度。
+
+USB 1.1设备也可以在USB 2.0系统上使用。
+当它们插入EHCI控制器时，会被交由USB 1.1的伴随（companion）控制器处理，
+该控制器通常为OHCI或UHCI。
+
+当USB 1.1设备插入USB 2.0集线器时，
+它们通过集线器中的事务转换器（Transaction Translator，TT）与EHCI控制器交互，
+该转换器将低速或全速事务转换为高速分割事务，从而避免浪费传输带宽。
+
+截至本文撰写时，该驱动已在以下EHCI实现上成功运行（按字母顺序）：
+Intel、NEC、Philips 和 VIA。
+其他供应商的EHCI实现正在陆续问世；
+预计该驱动在这些实现上也可正常运行。
+
+自2001年年中开始，usb存储设备已可使用（在2.4版EHCI驱动下性能良好），
+集线器从2001年底开始可用，而其他类型的高速设备似乎因USB 2.0原生硬件
+普及较慢而推迟上市。从2002年初开始，带USB 2.0的系统陆续上市，
+并在2002年下半年变得更加普及。
+
+注意：USB 2.0的支持不仅仅包含EHCI，还需要对Linux-USB核心API进行一些修改，
+包括Hub驱动，但这些修改通常不会影响USB核心对USB设备驱动暴露的基本API。
+
+- David Brownell
+  <dbrownell@users.sourceforge.net>
+
+
+功能性
+======
+
+该驱动会定期在x86硬件上进行测试，并已在PPC硬件上使用，因此大小端问题应已解决。
+相信它已经处理好所有PCI相关的细节，
+因此在具有特殊DMA映射问题的系统上I/O也应能正常运行。
+
+传输类型
+--------
+
+截至本文撰写时，该驱动应该已经可以很好地处理所有的控制传输、批量传输和中断传输，
+包括通过USB 2.0 Hub中的事务转换器与USB 1.1设备的通信，但仍可能存在bug。
+
+已经实现对高速等时ISO传输的支持，但截至本文撰写时，还没有Linux驱动程序使用该支持。
+
+通过事务转换器实现的全速等时传输目前尚未支持。
+需要注意的是，用于全速设备的等时拆分事务与高速等时传输
+在EHCI中采用完全不同的数据结构，因此相关代码几乎无
+法共用。因此，即使连接到高速总线，目前大多数USB音频和视频类设备
+也无法正常使用等时传输功能。
+
+驱动行为
+--------
+
+所有类型的传输都可以排队。
+这意味着来自不同接口（或通过 usbfs）的控制传输不会互相干扰，
+并且中断传输可以使用1帧的周期，而无需担心由于中断处理成本导致的数据丢失。
+
+
+EHCI根集线器代码会将USB 1.1设备交给其伴随控制器处理。
+EHCI驱动无需了解其他控制器的驱动程序；
+已经正常工作的OHCI或UHCI驱动，无需因为EHCI的存在而做任何修改。
+
+存在一些电源管理相关的问题；挂起/恢复行为目前不太正确。
+
+此外，在调度周期性事务（中断和等时传输）时采用了一些简化处理。
+这些简化会限制可调度的周期性传输数量，并且无法使用小于1帧的轮询间隔。
+
+使用方式
+=========
+
+假设你有一个EHCI控制器，并且已将此驱动编译为模块，可如下加载::
+
+    # modprobe ehci-hcd
+
+卸载方式::
+
+    # rmmod ehci-hcd
+
+你还应加载一个伴随控制器的驱动，例如ohci-hcd或uhci-hcd。
+如果EHCI驱动出现问题，只需卸载对应模块，
+伴随控制器驱动就会接手之前EHCI处理的所有设备（但速度更慢）。
+
+传递给modprobe的模块参数：
+
+    log2_irq_thresh (默认 0):
+    控制默认中断延迟的对数值（以微帧为单位）。
+    默认值0表示1个微帧（125 微秒）。
+    最大值6表示2^6=64个微帧。
+    该值控制EHCI控制器发出中断的频率。
+
+如果你在2.5内核上使用此驱动，并且启用了USB调试支持，
+你将在任何EHCI控制器的sysfs目录中看到三个文件：
+
+"async"
+输出异步调度队列，用于控制传输和批量传输。
+显示每个活动的qh和挂起的qtd，通常每个urb一个qtd。
+（对usb存储进行磁盘I/O时看看，可看到请求队列！）
+
+"periodic"
+输出周期性调度队列，用于中断传输和等时传输。不显示qtd。
+
+"registers"
+显示控制器寄存器状态。
+
+
+设备驱动程序通常不需要关心自己是否运行在EHCI上，
+但可能需要检查usb_device->speed是否是USB_SPEED_HIGH。
+高速设备可以执行全速（或低速）设备无法完成的操作，
+例如高带宽的周期性传输（中断传输或等时传输）。
+此外，设备描述符中的某些值（如周期性传输的轮询间隔）在高速模式下使用不同的编码方式。
+
+务必通过USB 2.0集线器测试设备驱动。
+当使用事务转换器时，这些集线器会以不同方式报告某些故障（如断开连接）。
+一些驱动在遇到与OHCI或UHCI报告不同的故障时可能会表现异常。
+
+软件性能
+========
+
+USB 2.0吞吐量受两个主要因素制约：主机控制器处理请求的速度，以及设备响应请求的速度。
+所有设备都遵循480Mbit/sec的原始传输速率，
+但总吞吐量还会受到诸如单个高速数据包之间的延迟、驱动程序调度策略，
+以及系统整体负载等因素的影响。
+延迟也是性能考量因素。
+
+批量传输通常用于对吞吐量有严格要求的场景。
+需要注意的是，批量传输总是以512字节的数据包为单位，
+并且在一个USB 2.0微帧中最多可容纳13个这样的数据包。
+八个USB 2.0微帧构成一个USB 1.1帧；
+一个微帧的时间为1毫秒 ÷ 8 = 125微秒。
+
+因此，当硬件和设备驱动软件都允许时，
+批量传输可提供超过50 MByte/sec的带宽。
+周期性传输模式（等时传输和中断传输）允许使用更大的数据包，
+从而使传输速率接近标称的480MBit/sec。
+
+硬件性能
+--------
+
+截至本文撰写时，单个USB 2.0设备的最大传输速率通常约为20 MByte/sec。
+这当然会随着时间改变：一些设备现在更快，一些更慢。
+
+第一代NEC EHCI实现似乎存在约28 MByte/sec的硬件瓶颈。
+虽然这足以让单设备跑到20 MByte/sec，
+但将三个此类设备放在同一总线上不能达到60 MByte/sec。
+问题似乎在于控制器硬件无法同时进行USB与PCI访问，
+因此每个微帧中只尝试6或7次USB事务，而不是13次。
+（对一个比其他产品早上市一年的芯片来说，这是个合理的妥协！）
+
+
+预计更新的实现会进一步优化这一点，
+通过投入更多芯片面积来解决问题，
+使新的主板芯片组更接近60 MByte/sec的目标。
+这包括NEC的更新实现，以及其他厂商的实现。
+
+
+主机接收来自EHCI控制器的请求，完成中断的最小延迟为一个微帧（125 微秒）。
+该延迟可以通过模块参数进行调整设置。
+默认情况下，ehci-hcd驱动使用最小延迟，
+这意味着当你发出控制或批量请求时，
+通常可以预期在不到250微秒内获知完成情况（具体取决于传输大小）。
+
+软件性能
+--------
+
+即使要达到20 MByte/sec的传输速率，Linux-USB设备驱动也必须保持EHCI队列满。
+这意味着发出较大的请求，或在需要发出一系列小请求时，使用批量排队（bulk queuing）。
+如果驱动未做到这一点，那么会直接从性能结果上表现出来。
+
+
+在典型场景下，使用usb_bulk_msg() 以4KB块循环写入，
+会浪费超过一半的USB 2.0带宽。
+I/O完成与驱动发出下一次请求之间的延迟通常比一次I/O操作所需的时间更长。
+如果同样的循环改用16KB块，会有所改善；使用128KB块的序列则能大幅减少浪费。
+
+
+与其依赖如此大的I/O缓冲区来提高同步I/O的效率，
+不如直接向主机控制器队列多个（批量）请求，并等待它们全部完成，或在出错时取消。
+这种URB排队方式对所有USB 1.1主机控制器驱动也适用。
+
+
+在Linux 2.5内核中，定义了新的 usb_sg_*() API 调用；
+它们会将scatterlist中的所有缓冲区排入队列。
+它们还使用scatterlist的DMA映射（可能会使用IOMMU）并减少中断次数，
+这些都有助于高速传输尽可能高效地运行。
+
+待办：
+   中断传输和等时（ISO）传输的性能问题。
+   这些周期性传输都是完全调度的，因此，主要问题可能在于如何触发高带宽模式。
+
+待办：
+   通过sysfs的uframe_periodic_max参数，可以分配超过标准80%的周期性带宽。
+   后续将对此进行说明。
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index e90465f0dc69..e26a5526c277 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -21,10 +21,10 @@ USB 支持
     authorization
     chipidea
     dwc3
+    ehci

 Todolist:

-*   ehci
 *   usbmon
 *   functionfs
 *   functionfs-desc
--
2.52.0


